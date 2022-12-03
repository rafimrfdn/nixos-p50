#!/run/current-system/sw/bin/sh

xrdb -merge .Xresources &
xset r rate 300 50 &
xset mouse 5 1 &
#slstatus &
copyq & copyq iconColor white &
volumeicon &
picom &
nm-applet &
sh $HOME/.fehbg &
sh .config/rustyvibes/rustyvibes & 
