#!/bin/sh

chosen=$(printf "Shutdown\nRestart\nSleep\nLogout" | rofi -dmenu -i -theme-str '@import "onedarkpowermenu4.rasi"')
#chosen=$(printf "Shutdown\nRestart\nLogout" | rofi -dmenu -i -theme-str )

case "$chosen" in
  "Shutdown") poweroff ;;
  "Restart") reboot ;;
  "Sleep") systemctl suspend ;;
  "Logout") pkill -u $USER ;;
  *) exit 1 ;;
esac
