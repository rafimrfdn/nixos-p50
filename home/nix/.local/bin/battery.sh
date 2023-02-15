#!/bin/bash

# If this script doesn't work look at the output of upower -e and upower -d

bat=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 |
  grep percentage |
  sed 's/ *percentage: *//g'`

state=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 |
  grep state |
  sed 's/ *state: *//'`

if [ $state == "charging" -o $state == "fully-charged" ]; then
  #    echo -n " "
  #    echo -n " "
  echo -n "$bat   "
  #  echo -n " "
  #    echo -n "Bat "
else
  # echo -n "$(percentage $bat            )"
  echo -n "$bat "
  #echo -n "   $bat"
  #    echo -n "   "
  #echo -n "$bat  "
fi

#echo -n "$bat "
