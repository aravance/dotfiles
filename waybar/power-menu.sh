#!/usr/bin/env bash

entries="⏻ Shutdown\n⭮ Reboot\n⇠ Logout\n⏾ Suspend"

selected=$(echo -e $entries | wofi -W 350 -L 4 -p "" -i --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  shutdown)
    exec systemctl poweroff -i;;
  reboot)
    exec systemctl reboot;;
  logout)
    swaymsg exit;;
  suspend)
    exec systemctl suspend;;
esac
