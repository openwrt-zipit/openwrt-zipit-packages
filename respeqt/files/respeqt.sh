#!/bin/sh
# RespeQt wrapper script

export QT_QPA_EVDEV_MOUSE_PARAMETERS=/dev/input/event5
export QT_QPA_EVDEV_KEYBOARD_PARAMETERS=/dev/input/event4
export QT_QPA_PLATFORM=linuxfb:fb=/dev/fb0:rotation=270:size=240x320
#export QT_DEBUG_PLUGINS=1

clear
echo "Starting RespeQt..."

respeqt.bin /root/.respeqt.respeqt