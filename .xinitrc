#!/bin/sh
PATH="$PATH:/usr/bin"

xset +fp /home/probst/.fonts &
xset fp rehash &
xset r rate 200 50 &
xsetroot -cursor_name left_ptr &
xset s 9000 9000 &
#xrandr --output HDMI-1-2 --auto --right-of HDMI-0 &
#setxkbmap -option caps:swapescape &
setxkbmap -model abnt2 -layout br -variant abnt2 &
redshift &
picom --config ~/.config/picom/picom.conf -b &
mpd &
dunst &
xrdb -merge ~/.Xresources &
wal -Rn &
#transmission-gtk -m &
#feh --bg-fill /home/probst/Images/Wallpapers/current-desktop.png

# SESSIONS
exec xmonad
#exec wmaker
#exec startxfce4
#exec startplasma-x11
