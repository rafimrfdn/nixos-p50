#!/run/current-system/sw/bin/sh

xrdb -merge .Xresources &
xset r rate 300 50 &
xset mouse 5 1 &
nm-applet &
#volumeicon &
xrandr --output DP-4 --scale 1.25x1.25 &
#slstatus &
picom &
copyq & copyq iconColor white &
sh $HOME/.fehbg &
easyeffects --gapplication-service &
#sh .config/rustyvibes/rustyvibes & 
