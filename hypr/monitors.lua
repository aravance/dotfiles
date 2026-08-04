-- Monitors and workspace rules, split out from hyprland.lua
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

local mainMon = "desc:LG Electronics 34GN850 004NTLE7N392"
local secondMon = "desc:Dell Inc. Dell S2417DG #ASNnISflverd"

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto", vrr = 1 })
hl.monitor({ output = mainMon, mode = "3440x1440@160", position = "0x0", scale = 1, vrr = 1 })
hl.monitor({ output = secondMon, mode = "2560x1440@120", position = "auto", scale = 1 })

hl.workspace_rule({ workspace = "1", monitor = mainMon, default = true })
hl.workspace_rule({ workspace = "2", monitor = mainMon })
hl.workspace_rule({ workspace = "3", monitor = secondMon, layout_opts = { orientation = "left" }, default = true })
hl.workspace_rule({ workspace = "4", monitor = secondMon, layout_opts = { orientation = "left" } })
