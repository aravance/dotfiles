-- Hyprland config, migrated from hyprland.conf (hyprlang) to Lua.
-- See https://wiki.hypr.land/Configuring/Start/

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
local mainMon = "desc:LG Electronics 34GN850 004NTLE7N392"
local secondMon = "desc:Dell Inc. Dell S2417DG #ASNnISflverd"

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto", vrr = 1 })
hl.monitor({ output = mainMon, mode = "3440x1440@160", position = "0x0", scale = 1, vrr = 1 })
hl.monitor({ output = secondMon, mode = "2560x1440@120", position = "auto", scale = 1 })


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")


---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "alacritty"
local fileManager = "dolphin"
local menu        = "wofi"


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
    -- core utils
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("mako")
    hl.exec_cmd("/usr/lib/pam_kwallet_init")
    hl.exec_cmd("/usr/libexec/polkit-kde-authentication-agent-1")
    hl.exec_cmd("keyd-application-mapper -d")

    -- other utils
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("syncthingtray-qt6 --wait")
    hl.exec_cmd("steam -silent", { workspace = "2 silent" })

    -- main apps
    hl.exec_cmd("alacritty -e tmux new -As prezto", { workspace = "1" })
    hl.exec_cmd("brave", { workspace = "1 silent" })

    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
end)


----------------
---- CONFIG ----
----------------

-- For all categories, see https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    ecosystem = {
        no_update_news  = true,
        no_donation_nag = true,
    },

    input = {
        kb_layout    = "us",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "",
        kb_rules     = "",

        follow_mouse = 1,

        touchpad     = {
            natural_scroll = false,
        },

        sensitivity  = 0, -- -1.0 <> 1.0, 0 means no modification.
    },

    general = {
        gaps_in       = 2,
        gaps_out      = 4,
        border_size   = 2,

        -- https://github.com/bluz71/vim-moonfly-colors
        col           = {
            active_border   = "rgba(80a0ffaa)",
            inactive_border = "rgba(333333aa)",
        },

        layout        = "master",

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,
    },

    decoration = {
        rounding = 4,

        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    -- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
    animations = {
        enabled = true,
    },

    -- https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
    master = {
        mfact       = 0.66,
        orientation = "right",
    },

    misc = {
        force_default_wallpaper  = 0, -- Set to 0 to disable the anime mascot wallpapers
        disable_splash_rendering = true,
    },
})


hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "default" })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })

hl.window_rule({ match = { class = "^steam$", title = "Steam - News" }, float = true })
hl.window_rule({ match = { class = "^steam$", title = "^Steam Settings$" }, float = true })
hl.window_rule({ match = { class = "^steam$", title = ".* - event started" }, float = true })
hl.window_rule({ match = { class = "^steam$", title = ".* CD key" }, float = true })
hl.window_rule({ match = { class = "^steam$", title = "^Steam - Self Updater$" }, float = true })
hl.window_rule({ match = { class = "^steam$", title = "^Screenshot Uploader$" }, float = true })
hl.window_rule({ match = { class = "^steam$", title = "^Steam Guard - Computer Authorization Required$" }, float = true })
hl.window_rule({ match = { class = "^steam$", title = "^Friends List$" }, float = true })
hl.window_rule({ match = { class = "^steam$", title = ".* Chat" }, float = true })
hl.window_rule({ match = { class = "^steam$" }, workspace = "2" })
hl.window_rule({ match = { class = "^steam_app_" }, workspace = "2" })
hl.window_rule({ match = { class = "^steam_app_" }, fullscreen = true })
hl.window_rule({ match = { title = "^Magic: The Gathering Online$", class = "^mtgo.exe$" }, workspace = "2" })
hl.window_rule({ match = { title = "^Magic: The Gathering Online$", class = "^mtgo.exe$" }, fullscreen = true })

hl.window_rule({ match = { class = "^Beyond-All-Reason$" }, workspace = "2" })
hl.window_rule({ match = { title = "^Beyond All Reason$" }, workspace = "2" })
hl.window_rule({ match = { title = "^Beyond All Reason$" }, fullscreen = true })

hl.window_rule({ match = { class = "^com-evacipated-cardcrawl-modthespire-Loader$" }, workspace = "2" })
hl.window_rule({ match = { title = "^Modded Slay the Spire$" }, workspace = "2" })
hl.window_rule({ match = { class = "^Slay the Spire 2$" }, workspace = "2" })

hl.window_rule({ match = { class = "discord" }, workspace = "3" })
hl.window_rule({ match = { class = "^info.mumble.Mumble$" }, workspace = "3" })
hl.window_rule({ match = { class = "^spotify" }, workspace = "4" })
hl.window_rule({ match = { class = "^(Alacritty)$", title = "^(btop)$" }, workspace = "3 silent" })

hl.window_rule({ match = { class = "^xdg-desktop-portal" }, size = { 1000, 700 } })

-- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
hl.workspace_rule({ workspace = "1", monitor = mainMon, default = true })
hl.workspace_rule({ workspace = "2", monitor = mainMon })
hl.workspace_rule({ workspace = "3", monitor = secondMon, layout_opts = { orientation = "left" }, default = true })
hl.workspace_rule({ workspace = "4", monitor = secondMon, layout_opts = { orientation = "left" } })


---------------------
---- KEYBINDINGS ----
---------------------

hl.bind("ALT + CTRL + SHIFT + XF86PowerOff", hl.dsp.exec_cmd("poweroff"))

-- Media controls
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +2%"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -2%"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { locked = true })
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
