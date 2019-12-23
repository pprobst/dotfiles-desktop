#!/bin/sh
PATH="$PATH:/usr/bin"

xset +fp /home/probst/.fonts &
xset fp rehash &
xset r rate 200 50 &
xsetroot -cursor_name left_ptr &
#xrandr --output HDMI-1-2 --auto --right-of HDMI-0 &
#setxkbmap -option caps:swapescape &
redshift &
compton --config ~/.config/compton/compton.conf -b &
mpd &
dunst &
#transmission-gtk -m &
xrdb -merge ~/.Xresources &
wal -R -n &
setxkbmap -model abnt2 -layout br -variant abnt2 &
feh --bg-fill /home/probst/Images/Wallpapers/current-desktop.png

# SESSIONS
exec xmonad
#exec ck-launch-session dbus-launch startxfce4
#exec startxfce4
#exec startlxqt
#exec startkde
#exec i3
#exec wmaker
