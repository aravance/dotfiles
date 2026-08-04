-- Hyprland config, migrated from hyprland.conf (hyprlang) to Lua.
-- See https://wiki.hypr.land/Configuring/Start/

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")

require("monitors")
require("autostart")
require("config")
require("rules")
require("keybindings")
