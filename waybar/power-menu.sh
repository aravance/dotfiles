#!/usr/bin/env bash

entries="⏻ Shutdown\n⭮ Reboot\n⇠ Logout\n⏾ Suspend"

selected=$(echo -e $entries | wofi -W 350 -L 4 -p "" -D single_click=true -i --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

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
