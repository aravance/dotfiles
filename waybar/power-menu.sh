#!/usr/bin/env bash

entries="⏻ Shutdown\n⭮ Reboot\n⇠ Logout\n⏾ Suspend"

# there's a bug in wofi-1.5 causing -L to fail for wofi, set height directly for now -L 4
selected=$(echo -e $entries | wofi --width 140 --height 205 -p "" -D single_click=true -i --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  shutdown)
    exec systemctl poweroff -i;;
  reboot)
    exec systemctl reboot;;
  logout)
    hyprctl dispatch exit;;
  suspend)
    exec systemctl suspend;;
esac
