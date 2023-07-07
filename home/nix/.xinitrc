#!/usr/bin/env bash

#xsetroot -cursor_name left_ptr &
#xset r rate 300 50 &
#xset mouse 5 1 &
#feh --bg-fill --randomize ~/Pictures/wp/* &
#xrdb -merge .Xresources &
#
#while true;do
#  dbus-launch --exit-with-session dwm > /dev/null 2>&1
#done
#exec dwm

#setxkbmap us &
#dbus-launch --exit-with-session bspwm

#exec xfce4-session


#if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
#	eval $(dbus-launch --exit-with-session --sh-syntax)
#fi
#systemctl --user import-environment DISPLAY XAUTHORITY
#
#if command -v dbus-update-activation-environment >/dev/null 2>&1; then
#        dbus-update-activation-environment DISPLAY XAUTHORITY
#fi

export XDG_SESSION_TYPE=x11

exec awesome
