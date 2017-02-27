#!/bin/sh
# FUSE wrapper

cd /root
/usr/bin/fuse

# If program crashed we need to fix the tty
if [ $? -gt 0 ]; then
	/usr/bin/termfix /dev/tty`fgconsole`
fi