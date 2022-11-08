#!/bin/sh

chosen=$(printf "Shutdown\nRestart\nLogout" | rofi -dmenu -i -theme-str '@import "onedarkpowermenu.rasi"')

case "$chosen" in
  "Shutdown") poweroff ;;
  "Restart") reboot ;;
  "Logout") pkill -u $USER ;;
  *) exit 1 ;;
esac
