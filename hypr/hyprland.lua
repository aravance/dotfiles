-- Hyprland config, migrated from hyprland.conf (hyprlang) to Lua.
-- See https://wiki.hypr.land/Configuring/Start/

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
-- Only use the RX 7900; the iGPU (TV) belongs to seat1. Symlink from /etc/udev/rules.d/61-dri-names.rules.
hl.env("AQ_DRM_DEVICES", "/dev/dri/rx7900")

require("monitors")
require("autostart")
require("config")
require("rules")
require("keybindings")
