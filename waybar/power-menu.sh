#!/usr/bin/env bash

shutdown='<span size="x-large">⏻</span> Shutdown'
reboot='<span>⭮</span> Reboot'
logout='<span>⇠</span> Logout'
suspend='<span>⏾</span> Suspend'
entries="$shutdown\n$reboot\n$logout\n$suspend"

# there's a bug in wofi-1.5 causing -L to fail for wofi, set height directly for now -L 4
selected=$(echo -e $entries | wofi --allow-markup --width 220 --height 250 -p "" -D single_click=true -i --dmenu --cache-file /dev/null | awk '{print tolower($NF)}')
echo $selected

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
