# use xresources
xrdb -merge ~/.Xresources

# background
[ -e ~/.fehbg ] && source ~/.fehbg

# pulse audio session
start-pulseaudio-x11

# hide mouse coursor when it isn't used
unclutter -root -visible &

# notification
dunst -config ~/.i3/dunstrc &

# terminal daemon
urxvtd -q -f -o
