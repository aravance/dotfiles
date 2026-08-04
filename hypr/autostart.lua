-- Autostart config, split out from hyprland.lua
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
