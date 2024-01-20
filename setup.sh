#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

dirs=(hypr waybar tmux git alacritty wofi)

for d in "${dirs[@]}";do
  ln -s "${SCRIPT_DIR}/$d" ~/.config 2>/dev/null
done
