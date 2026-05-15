-- Configs
require("~/.config/hypr/windowrules.conf") --  windowrules
require("~/.config/hypr/monitors.lua") --     Displays
require("~/.config/hypr/permissions.lua") --  permissions
require("~/.config/hypr/keybinds.conf") --     bindings
require("~/.config/hypr/input.conf") --        devices and cursor
require("~/.config/hypr/autostart.lua") --    Autostart
-----------------------
---- LOOK AND FEEL ----
-----------------------
local terminal    = "ghostty"
hl.config({
  general = {
    gaps_in = 4,
    gaps_out = 0,
    border_size = 2,
        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = 0,
        allow_tearing = 1                      -- could improve latency in games + need to add a window rule per app to activate it
        layout = "dwindle",
        no_focus_fallback = true,
        --no_border_on_floating = 0,
        resize_corner = 3,
        float_gaps = 0,
        gaps_workspaces = 1,
        snap = {
            enabled = 1,
            window_gap = 10,
            monitor_gap = 10,
            border_overlap = 1,
            respect_gaps = 1,
        },
    },
    decoration = {
        rounding       = 10,
        rounding_power = 4,
        dim_inactive = false
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        fullscreen_opacity = 1
        dim_modal = 0,               --enables dimming modal windows 
        dim_strength = 0.2,
        dim_special = 0.2,
        dim_around = 0.2,
        -- screen_shader = 
        border_part_of_window = 0,   -- consider the border a part of the window
        shadow = {
            enabled = 1,
            range = 4,
            render_power = 1,
            sharp = 0,
            color = 0xee1a1a1a,
            color_inactive = 0xee1a1a1a,
            offset = 0 0,
            scale = 1,
        },
        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
            ignore_opacity = 1
            new_optimizations = 1
            xray = 0                   -- dont blur overlaping windows
            noise = 0.3
            contrast = 1 
            brightness = 1 
            vibrancy_darkness = 0
            special = 0
            popups = 0                         -- whether to blur popups (e.g. right-click menus)
            popups_ignorealpha = 0
            input_methods = 0 
            input_methods_ignorealpha = 0
        },
    },

    animations = {
        enabled = false,
        workspace_wraparound = true,
    },
})

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })


-- Layouts
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})
hl.config({
    master = {
        new_status = "master",
    },
})
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    disable_splash_rendering = 1,
    disable_scale_notification = 0,
    mouse_move_enables_dpms = 1,
    key_press_enables_dpms = 1,
    layers_hog_keyboard_focus = 1,           -- overlys retain focus on mouse move
    background_color = 0x000000,
    font_family = "ttf-go-nerd",
    animate_manual_resizes = 0,
    animate_mouse_windowdragging = 0,
    enable_swallow = 0,                      -- Programms swallow terminal on start
    --swallow_regex = kitty,
    --swallow_regex = com.mitchellh.ghostty,
    enable_anr_dialog = 0,                   -- enable the ANR (app not responding) dialog when apps hang
    anr_missed_pings = 0,                    -- anr_missed_pings
    focus_on_activate = 1,                   -- allows apps to request focus
    allow_session_lock_restore = 1,          -- restore session on lockscreenapp crash
    session_lock_xray = 0,                   -- render session under lockscreen
    close_special_on_empty = 1,
    --new_window_takes_over_fullscreen = 2,   -- 0 - behind, 1 - takes over, 2 - unfullscreen/unmaxize
    exit_window_retains_fullscreen = 0,      -- stay in fs mode even if fs app exits
    initial_workspace_tracking = 2,          -- windows will open on the workspace they were invoked on. 0 - disabled, 1 - single-shot, 2 - persistent (all children too)
    middle_click_paste = 0,
    vrr = 2,
    },
    opengl = {
        nvidia_anti_flicker = 1,             -- 1 should reduce flickering , enable if flickering sdhow up
    },
    render = {
    cm_enabled = 1,
    direct_scanout = 1,                 -- Reduce lag when there is only one fullscreen application on a screen (e.g. game). set to 0 if fullscreen app shows graphical glitches. 0 - off, 1 - on, 2 - only in game
    expand_undersized_textures = 1,      -- expand undersized textures along edge, or stretch entire texture.
    xp_mode = 0,                         -- Disables back buffer and bottom layer rendering.
    ctm_animation = 0,                   -- fade temp changes, disable for nvidia
    cm_sdr_eotf = 2,                     -- default transfer function for displaying SDR apps. 0 - Treat unspecified as sRGB, 1 - Treat unspecified as Gamma 2.2, 2 - Treat unspecified and sRGB as Gamma 2.2
    send_content_type = 1,               -- monitor profile autoswithc 
    cm_auto_hdr = 0,                     -- 2 uses hdreid
    new_render_scheduling = 0,           -- tripple buffering disabled is better
},
xwayland = {
    enabled = 1,
    use_nearest_neighbor = 0,    -- 1 pixelated 0 blurry xwayland apps
    create_abstract_socket = 1,  -- might make sandboxing xwaylandapps harder
    force_zero_scaling = 1,
},
ecosystem = {
    no_update_news = 0, -- News are needed bc features change alot
    no_donation_nag = 1,
},
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
