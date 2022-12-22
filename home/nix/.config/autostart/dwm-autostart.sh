#!/run/current-system/sw/bin/sh

xrdb -merge .Xresources &
xset r rate 300 50 &
xset mouse 5 1 &
#slstatus &
xrandr --output DP-4 --scale 1.25x1.25 &
copyq & copyq iconColor white &
volumeicon &
easyeffects --gapplication-service &
picom &
nm-applet &
sh $HOME/.fehbg &
#sh .config/rustyvibes/rustyvibes & 
