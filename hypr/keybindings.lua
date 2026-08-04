-- Keybindings, split out from hyprland.lua
-- See https://wiki.hypr.land/Configuring/Basics/Binds/ and Dispatchers/

-- Set programs that you use
local terminal    = "alacritty"
local fileManager = "dolphin"
local menu        = "wofi"

hl.bind("ALT + CTRL + SHIFT + XF86PowerOff", hl.dsp.exec_cmd("poweroff"))

-- Media controls
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_SINK@ 2%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 2%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

hl.bind("ALT + return", hl.dsp.exec_cmd(terminal))
hl.bind("ALT + SHIFT + b", hl.dsp.exec_cmd("alacritty -T btop -e btop"))
hl.bind("ALT + SHIFT + y", hl.dsp.exec_cmd("brave --new-window https://www.youtube.com", { workspace = "4" }))
hl.bind("ALT + SHIFT + g", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + space", hl.dsp.exec_cmd("pkill " .. menu .. " || " .. menu))
hl.bind("SUPER + SHIFT + q", hl.dsp.window.close())
hl.bind("ALT + CTRL + SHIFT + q", hl.dsp.exit()) -- wiki recommends `hyprshutdown` instead, see Dispatchers page
hl.bind("ALT + p", hl.dsp.window.pseudo())

hl.bind("ALT + SHIFT + f", hl.dsp.window.fullscreen())
hl.bind("ALT + SHIFT + t", hl.dsp.window.float())

-- layout-agnostic next/prev in tiling order (was `cyclenext` / `cyclenext prev`)
hl.bind("ALT + j", hl.dsp.window.cycle_next())
hl.bind("ALT + k", hl.dsp.window.cycle_next({ next = false }))
hl.bind("ALT + CTRL + SHIFT + j", hl.dsp.layout("swapnext"))
hl.bind("ALT + CTRL + SHIFT + k", hl.dsp.layout("swapprev"))
hl.bind("ALT + SHIFT + return", hl.dsp.layout("swapwithmaster"))
hl.bind("ALT + code:59", hl.dsp.layout("addmaster"))    -- alt+,
hl.bind("ALT + code:60", hl.dsp.layout("removemaster")) -- alt+.

hl.bind("ALT + SHIFT + c", hl.dsp.focus({ monitor = "r" }))
hl.bind("ALT + SHIFT + x", hl.dsp.focus({ monitor = "l" }))
hl.bind("ALT + CTRL + SHIFT + c", hl.dsp.window.move({ monitor = "r" }))
hl.bind("ALT + CTRL + SHIFT + x", hl.dsp.window.move({ monitor = "l" }))

hl.bind("ALT + e", hl.dsp.focus({ workspace = "m-1" }))
hl.bind("ALT + d", hl.dsp.focus({ workspace = "m+1" }))
hl.bind("ALT + SHIFT + e", hl.dsp.window.move({ workspace = "m-1" }))
hl.bind("ALT + SHIFT + d", hl.dsp.window.move({ workspace = "m+1" }))

-- Switch workspaces with ALT + SHIFT + [0-9]
-- Move active window to a workspace with ALT + CTRL + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("ALT + SHIFT + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind("ALT + CTRL + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind("ALT + z", hl.dsp.workspace.toggle_special("magic"))
hl.bind("ALT + SHIFT + z", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with ALT + scroll
hl.bind("ALT + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("ALT + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with ALT + LMB/RMB and dragging
hl.bind("ALT + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("ALT + mouse:273", hl.dsp.window.resize(), { mouse = true })
