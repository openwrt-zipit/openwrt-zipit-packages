#!/bin/sh
# mdev automount filesystems
# http://www.armadeus.org/wiki/index.php?title=Automatically_mount_removable_media

destdir=/mnt

my_umount()
{
	if grep -qs "^/dev/$1 " /proc/mounts ; then
		umount "${destdir}/$1";
	fi

	[ -d "${destdir}/$1" ] && rmdir "${destdir}/$1"
}

my_mount()
{
	# skip mounting if device is rootfs
	/bin/grep -q "root=/dev/$1" /proc/cmdline
	if [ $? -ne 0 ]; then
		mkdir -p "${destdir}/$1" || exit 1

		if ! mount -t auto -o async "/dev/$1" "${destdir}/$1"; then
			# failed to mount, clean up mountpoint
			rmdir "${destdir}/$1"
			exit 1
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
