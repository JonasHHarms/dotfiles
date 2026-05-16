--- KEYBINDINGS ----
hl.config({ 
    binds = {
    pass_mouse_when_bound = 0, -- mouse moves with keybind (alt+mouseleft as a bind)
    scroll_event_delay = 10, -- mouse wheele scroll at lease x
    workspace_back_and_forth = 0, -- switch to the currently focused workspace will instead switch to the previous workspace.
    hide_special_on_workspace_change = 0,
    allow_workspace_cycles = 1, -- allow endless previouzs workspace cycke
    workspace_center_on = 1, -- 1 measn go to last active window on ws instead of center
    focus_preferred_method = 0, -- focus chanign based on edge instead of history (0)
    movefocus_cycles_fullscreen = 1,
    movefocus_cycles_groupfirst = 0,
    disable_keybind_grabbing = 1,
    window_direction_monitor_fallback = 1, -- move windowsn between monitors
    drag_threshold = 10, -- drage mouse at least this far for mousedrag binds
},})

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("ghostty -e tmux attach-session -t mainctl"))
hl.bind(mainMod .. " + CONTROL_L + ESCAPE", hl.dsp.exec_cmd("loginctl terminate-user $USER"))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + Y", hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind("ALT_L + F4", hl.dsp.layout("hyprctl dispatch killactive"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("foot"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("pidof hyprlock || hyprlock"))

-- workspaces
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
hl.bind("ALT + Tab", hl.dsp.exec_cmd("snappy-switcher next"))
hl.bind("ALT + SHIFT + Tab", hl.dsp.exec_cmd("snappy-switcher prev"))
hl.bind(mainMod .. " + A",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + F", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + D",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + S",  hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + H",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("resizeactive 100 -100"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("resizeactive -100 100"))

-- Mouse
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- multimedia keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("$HOME/.config/dunst/volumenotify.sh 2%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("$HOME/.config/dunst/volumenotify.sh 2%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle && $HOME/.config/dunst/volumenotify.sh"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("$HOME/.config/dunst/volumenotify.sh 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("$HOME/.config/dunst/volumenotify.sh 10%- "), { locked = true, repeating = true })
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Clipboard 
hl.bind(mainMod .. "+ V", hl.dsp.exec_cmd("cliphist list | wofi --dmenu --conf='$HOME/.config/wofi/config' --pre-display-cmd 'echo %s | cut -f 2' | cliphist decode | wl-copy"))
hl.bind(mainMod .. "+ SHIFT + V", hl.dsp.exec_cmd("cat $HOME/.config/cliphist/favs | wofi --dmenu --conf='$HOME/.config/wofi/config' | wl-copy"))

