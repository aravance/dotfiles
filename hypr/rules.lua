-- Window rules, split out from hyprland.lua
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
hl.on("window.open", function(w)
    if w.class == "Slay the Spire 2" then
        hl.dispatch(hl.dsp.layout("swapwithmaster master"))
    end
end)

hl.window_rule({ match = { class = "discord" }, workspace = "3" })
hl.window_rule({ match = { class = "^info.mumble.Mumble$" }, workspace = "3" })
hl.window_rule({ match = { class = "^(Alacritty)$", title = "^(btop)$" }, workspace = "3 silent" })

hl.window_rule({ match = { class = "^spotify" }, workspace = "4" })

hl.window_rule({ match = { class = "^xdg-desktop-portal" }, size = { 1000, 700 } })
