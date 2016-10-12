#!/bin/sh
 
# cd /usr/share/navit
 
# Set some paths.
# export PATH=$PATH:/usr/share/navit/bin
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/share/navit/lib
# export HOME=/usr/share/navit/home/
# export NAVIT_LIBDIR=/usr/share/navit/lib/navit
# export NAVIT_SHAREDIR=/usr/share/navit/share
 
 # tslib requirements.
# export TSLIB_CONSOLEDEVICE=none
# export TSLIB_FBDEVICE=/dev/fb
# export TSLIB_TSDEVICE=/dev/ts
# export TSLIB_CALIBFILE=/usr/share/navit/ts/pointercal
# export TSLIB_CONFFILE=/usr/share/navit/ts/ts.conf
# export TSLIB_PLUGINDIR=/usr/share/navit/lib/ts
 
 # SDL requirements.
# export SDL_MOUSEDRV=TSLIB
# export SDL_MOUSEDEV=$TSLIB_TSDEVICE
# export SDL_NOMOUSE=1
# export SDL_FBDEV=/dev/fb
# export SDL_VIDEODRIVER=fbcon
# export SDL_AUDIODRIVER=dsp
 
 # fontconfig requirements
 #export FC_CONFIG_DIR=/usr/share/navit/fonts
# export FONTCONFIG_DIR=/usr/share/navit/fonts
# export FC_CONFIG_FILE=/usr/share/navit/fonts/fonts.conf
# export FONTCONFIG_FILE=/usr/share/navit/fonts/fonts.conf
# export FC_DEBUG=0
 
 # Set language.
 export LANG=en_US.utf8
 
 # Run Navit.
#usr/bin/navit /root/.navit/navit.xml 2>/usr/share/navit/navit.log
/usr/bin/navit 2>/tmp/navit.log
