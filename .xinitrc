#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
. /etc/X11/Xsession

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

# Launch i3 window manager
exec i3
