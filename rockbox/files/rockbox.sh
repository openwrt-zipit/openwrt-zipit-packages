# Set speaker vol to 0 for rockbox. 
amixer -q sset "Speaker" 0%      
#amixer -q sset "Headphone" 95% 

# Headphone or Line-out tone settings.
amixer -q sset "Bass" 47%
amixer -q sset "Treble" 47%     

#export SDL_AUDIODRIVER=dsp 
export SDL_AUDIODRIVER=alsa

export SDL_NOMOUSE=1 
export SDL_VIDEO_FBCON_ROTATION="CCW" 
rockbox.bin

# Restore Speaker volume and tone settings.
amixer -q sset "Speaker" 100%
amixer -q sset "Bass" 0%
amixer -q sset "Treble" 100%

