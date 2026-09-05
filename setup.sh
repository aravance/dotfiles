#!/bin/sh

SCRIPT_DIR=$(cd -- "$(dirname -- "$0")" >/dev/null 2>&1 && pwd)

dirs="hypr waybar tmux git alacritty wofi keyd wireplumber"

for d in $dirs;do
  ln -s "$SCRIPT_DIR/$d" ~/.config 2>/dev/null
done
