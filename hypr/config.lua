-- General config, split out from hyprland.lua
-- For all categories, see https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
    ecosystem = {
        no_update_news  = true,
        no_donation_nag = true,
    },

    input = {
        kb_layout    = "us",

        follow_mouse = 1,

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
