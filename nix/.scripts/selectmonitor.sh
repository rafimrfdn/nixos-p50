#!/bin/sh

function selectmonitor {
  #  options="Mirror\nExtend\nLaptop\nHDMI"
  options="Mirror\nExtend\nLaptop"
  selected=$(echo -e $options | rofi -dmenu -i -theme-str '@import "gnomepowermenu.rasi"')
  #  if [[ $selected = "HDMI" ]]; then
  #    xrandr --output eDP-1 --off --output DP-1-2 --primary --mode 1920x1080 --pos 1920x0 --rotate normal
  if [[ $selected = "Laptop" ]]; then
    xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-2 --off
  elif [[ $selected = "Extend" ]]; then
    xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-2 --mode 1920x1080 --pos 1920x0 --rate 74.97 --rotate normal
  elif [[ $selected = "Mirror" ]]; then
    xrandr --output eDP-1 --primary --output DP-1-2 --same-as eDP-1
  fi
}
xrandr --setprovideroutputsource 1 0 && selectmonitor
