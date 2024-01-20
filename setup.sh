#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

local dirs=(hypr waybar tmux git)

for d in $dirs;do
  ln -s "${SCRIPT_DIR}/$d" ~/.config
done
