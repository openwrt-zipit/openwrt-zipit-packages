#!/bin/sh
# mdev automount filesystems
# http://www.armadeus.org/wiki/index.php?title=Automatically_mount_removable_media

destdir=/mnt

# Mount by filesystem label; requires blkid package
if [ -x /usr/sbin/blkid ]; then
	label=`/usr/sbin/blkid "/dev/${MDEV}" | sed 's/.*LABEL="//' | sed 's/".*//'`
	# if disk has no label, mount by device
	if [ -z "$label" ]; then
		bylabel=0
	else
		bylabel=1
		# check for duplicate label; add part of UUID if duplicate
		if grep -qs "${label}" /proc/mounts ; then
			label="${label}_`/usr/sbin/blkid "/dev/${MDEV}" | sed 's/.*PARTUUID="//' | sed 's/".*//'`"
		fi
	fi
else
	bylabel=0
fi

my_umount()
{
	if grep -qs "^/dev/$1 " /proc/mounts ; then
		umount "/dev/$1";
	fi

	[ -d "${destdir}/$1" ] && rmdir "${destdir}/$1"
	[ -d "${destdir}/${label}" ] && rmdir "${destdir}/${label}"
}

my_mount()
{
	# skip mounting if device is rootfs
	/bin/grep -q "root=/dev/$1" /proc/cmdline
	if [ $? -ne 0 ]; then
		if [ $bylabel -eq 1 ]; then
			# Mount by label
			mkdir -p "${destdir}/${label}" || exit 1
			if ! mount -t auto -o async "/dev/$1" "${destdir}/${label}"; then
				# failed to mount, clean up mountpoint
				rmdir "${destdir}/${label}"
				exit 1
			fi
		else
			# Mount by device id
			mkdir -p "${destdir}/$1" || exit 1
			if ! mount -t auto -o async "/dev/$1" "${destdir}/$1"; then
				# failed to mount, clean up mountpoint
				rmdir "${destdir}/$1"
				exit 1
			fi
		fi
	fi
}

case "${ACTION}" in
add|"")
	my_umount ${MDEV}
	my_mount ${MDEV}
	;;
remove)
	my_umount ${MDEV}
	;;
esac
