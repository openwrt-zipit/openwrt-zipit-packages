if [ $TMUX ]; then
	# Set tmux to play sound on bell even if detatched
	tmux set-hook -g alert-bell 'run "/usr/bin/aplay /usr/share/sounds/z2beep.wav; exit 0"'
fi
