#!/bin/sh
 
 cd /mnt/sd0
 
 # Set some paths.
 export PATH=$PATH:/mnt/sd0/navit/bin
 export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/mnt/sd0/navit/lib
 export HOME=/mnt/sd0/home/
 export NAVIT_LIBDIR=/mnt/sd0/navit/lib/navit
 export NAVIT_SHAREDIR=/mnt/sd0/navit/share
 
 # tslib requirements.
# export TSLIB_CONSOLEDEVICE=none
# export TSLIB_FBDEVICE=/dev/fb
# export TSLIB_TSDEVICE=/dev/ts
# export TSLIB_CALIBFILE=/mnt/sd0/navit/ts/pointercal
# export TSLIB_CONFFILE=/mnt/sd0/navit/ts/ts.conf
# export TSLIB_PLUGINDIR=/mnt/sd0/navit/lib/ts
 
 # SDL requirements.
# export SDL_MOUSEDRV=TSLIB
# export SDL_MOUSEDEV=$TSLIB_TSDEVICE
# export SDL_NOMOUSE=1
# export SDL_FBDEV=/dev/fb
# export SDL_VIDEODRIVER=fbcon
# export SDL_AUDIODRIVER=dsp
 
 # fontconfig requirements
 export FC_CONFIG_DIR=/mnt/sd0/navit/fonts
 export FONTCONFIG_DIR=/mnt/sd0/navit/fonts
 export FC_CONFIG_FILE=/mnt/sd0/navit/fonts/fonts.conf
 export FONTCONFIG_FILE=/mnt/sd0/navit/fonts/fonts.conf
 export FC_DEBUG=0
 
 # Set language.
 export LANG=en_US.utf8
 
 # Run Navit.
 /mnt/sd0/navit/bin/navit /mnt/sd0/navit/share/navit.xml 2>/mnt/sd0/navit/navit.log
