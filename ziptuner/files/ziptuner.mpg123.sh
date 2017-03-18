#!/bin/sh

cd /usr/share/ziptuner
TERM=xterm-color DIALOGRC=/usr/share/ziptuner/dialogrc.soho /usr/bin/ziptuner.bin -p "mpg123tty4 -@ " /root/radio /root/.config/gmu/playlist.m3u
