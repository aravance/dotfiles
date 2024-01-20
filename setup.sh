#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

local dirs=(hypr waybar tmux)

for d in $dirs;do
  ln -s "${SCRIPT_DIR}/$d" ~/.config
done
