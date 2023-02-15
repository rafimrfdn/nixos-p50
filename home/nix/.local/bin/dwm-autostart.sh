#!/bin/sh

xrdb -merge .Xresources &
xset r rate 300 50 &
xset mouse 5 1 &
dwmblocks & 
copyq &
picom &
nm-applet &
volumeicon &
sh $HOME/.fehbg &
sh $HOME/.config/rustyvibes/rustyvibes.sh &
