---- WINDOWS AND WORKSPACES ----

-- Hyprland-run windowrule, copied from example
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 m1itor_h-120",
    float = true,
})

-- example rule that was recommended, might delete
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
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

hl.config({
group =  {
    auto_group = 0,
    insert_after_current = 1,
    drag_into_group = 2, -- Drag 1 groupbar
    merge_groups_on_drag = 1,
    merge_groups_on_groupbar = 1,
    merge_floated_into_tiled_on_groupbar = 1,
    col = {
        border_locked_active = 0x66ffffff,
        border_active = 0x66ffffff,
        border_inactive = 0x66ffffff,
        border_locked_inactive = 0x66ffffff,
        },
    groupbar = {
        enabled = 1,
        scrolling = 1,                   -- Scrolling 1 bar moves focus
        priority = 3,                    -- 3 is default decorati1 priority
        stacked = 0,
        height = 18,
        indicator_gap = 2,
        indicator_height = 2,
        rounding = 10,                   -- rounds ends of indicator bar
        round_only_edges = 0,            -- also round middle indicators
        rounding_power = 10,             -- larger eq rounder
        render_titles = 1,
        text_offset = 0,                 -- vertical positi1
        text_padding = 0,                -- horis1tal offset
        text_color = 0x66ffffff,
        text_color_inactive = 0x66ffff00,
        text_color_locked_active = 0x66ffffff,
        text_color_locked_inactive = 0x66ffffff,
        -- font_family =                 -- font override
        font_size = 12,
        font_weight_active = "bold",
        font_weight_inactive = "normal",
        gradients = 1,                   -- Backgroundcolor of tabs
        gradient_rounding = 10,          -- Rounds bar background ends 
        gradient_round_only_edges = 0,   -- Also round middle
        gradient_rounding_power = 2,     -- larger eq smoother max is 10
        col = {
            active = 0x66ffffff,
            inactive = 0x66ffffff,
            locked_active = 0x66ffffff,
            locked_inactive = 0x66ffffff,
        },
        gaps_in = 5,
        gaps_out = 5,
        keep_upper_gap = 0,
        blur = 1,
        },
    },
})

hl.window_rule({
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

hl.window_rule({
    name = "utilsgroup",
    match = {
        tag = "utils",
    },
    float = 1,
    no_initial_focus = 1,
    focus_on_activate = 0,
    size = {500, 250},
    group = "set always",
})

hl.window_rule({
    name = "agswidgets",
    match = {
        initial_class = "io.Astal.ags",
    },
    render_unfocused = 1,
    tag = "utils",
})

hl.window_rule({
    name = "peaclock",
    match = {
        initial_class = "peaclock",
    },
    tag = "utils",
})

hl.window_rule({
    name = "PDFs",
    match = {
        initial_class = "org.pwmt.zathura",
    },
    float = 0,
    tile = 1,
    no_initial_focus = 0,
    focus_on_activate = 1,
    group = "set always lock invade",

})
hl.window_rule({
    name = "popupdialoges",
    match = {
        modal = 1,
    },
    tag = "+popupdialog",
    move = {"(cursor_x-(window_w*-0.5))", "(cursor_y-(window_h))"}, -- Open at the mouse pos ,
    border_color = "rgb(255,0,0)",
    border_size = 5,
    no_initial_focus = 0,
    rounding = 0,
    dim_around = 1,
    focus_on_activate = 1,
})

    ------ Match --------
    --match = {class =                     -- Windows with class matching =.
    --match = {title =                     -- Windows with title matching =.
    --match = {initial_class =             -- Windows with initialClass matching =.
    --match = {initial_title =             -- Windows with initialTitle matching =.
    --match = {tag =                       -- Windows with matching tag.
    --match = {xwayland =                  -- Xwayland windows.
    --match = {float =                     -- Floating windows.
    --match = {fullscreen =                -- Fullscreen windows.
    --match = {pin =                       -- Pinned windows.
    --match = {focus =                     -- Currently focused window.
    --match = {group =                     -- Grouped windows.
    --match = {modal =                     -- Modal windows (e.g. “Are you sure” popups)
    --match = {fullscreen_state_client =   -- Windows with matching fullscreenstate. client can be 0 - n1e, 1 - maximize, 2 - fullscreen, 3 - maximize and fullscreen.
    --match = {fullscreen_state_internal = -- Windows with matching fullscreenstate. internal can be 0 - n1e, 1 - maximize, 2 - fullscreen, 3 - maximize and fullscreen.
    --match = {workspace =                 -- Windows 1 matching workspace. w can be id, name:string or workspace selector.
    --match = {c1tent =                   -- Windows with specified c1tent type (n1e = 0, photo = 1, video = 2, game = 3)
    --match = {xdg_tag =                   -- Match a window by its xdgTag (see hyprctl clients to check if it has 1e)

    ------ Static rules ------
    --float =             -- Floats a window.
    --tile =              -- Tiles a window.
    --fullscreen =        -- Fullscreens a window.
    --maximize =          -- Maximizes a window.
    --fullscreen_state =  -- Sets the focused window’s fullscreen mode and the 1e sent to the client, where internal and client can be 0 - n1e, 1 - maximize, 2 - fullscreen, 3 - maximize and fullscreen.
    --move =              -- Moves a floating window to a given coordinate, m1itor-local. Two expressi1s are space-separated.
    --size =              -- Resizes a floating window to a given size. Two expressi1s are space-separated.
    --center =            -- If the window is floating, will center it 1 the m1itor.
    --pseudo =            -- Pseudotiles a window.
    --m1itor =           -- Sets the m1itor 1 which a window should open. id can be either the id number or the name (e.g. 1 or DP-1).
    --workspace =         -- Sets the workspace 1 which a window should open (for workspace syntax, see dispatchers->workspaces). You can also set [w= -- to unset. This will unset all previous workspace rules applied to this window. Additi1ally you can add silent after the workspace to make the window open silently.
    --no_initial_focus =  -- Disables the initial focus to the window
    --pin =               -- Pins the window (i.e. show it 1 all workspaces). Note: floating only.
    --suppress_event =    -- Ignores specific events from the window. Events are space separated, and can be: fullscreen, maximize, activate, activatefocus, fullscreenoutput.
    --c1tent =           -- [n1e|photo|video|game Sets c1tent type.
    --no_close_for =      -- Makes the window uncloseable with the killactive dispatcher for a given amount of ms 1 open.:

    ------ Dynamic rules ------
    --persistent_size =        -- For floating windows, internally store their size. When a new floating window opens with the same class and title, restore the saved size.
    --no_max_size =            -- Removes max size limitati1s. Especially useful with windows that report invalid max sizes (e.g. winecfg).
    --stay_focused =           -- Forces focus 1 the window as l1g as it’s visible.
    --animati1 =              -- Forces an animati1 1to a window, with a selected opt. Opt is opti1al.
    --border_color =           -- Force the border color of the window. Opti1s for c: color/color ... color angle -> sets the active border color/gradient OR color color/color ... color angle color ... color [angle] -> sets the active and inactive border color/gradient of the window. See variables->colors for color definiti1.
    --idle_inhibit =           -- Sets an idle inhibit rule for the window. If active, apps like hypridle will not fire. Modes: n1e, always, focus, fullscreen.
    --opacity =                -- Additi1al opacity multiplier. Opti1s for a: float -> sets an overall opacity, float float -> sets active_opacity and inactive_opacity respectively, float float float -> sets active_opacity, inactive_opacity and fullscreen_opacity respectively.
    --tag =                    -- Applies the tag name to the window, use prefix +/- to set/unset flag, or no prefix to toggle the flag.
    --max_size =               -- Sets the maximum size (x,y -> int). Applies to floating windows. (use misc:size_limits_tiled to include tiled windows.)
    --min_size =               -- Sets the minimum size (x,y -> int). Applies to floating windows. (use misc:size_limits_tiled to include tiled windows.)
    --border_size =            -- Sets the border size.
    --rounding =               -- Forces the applicati1 to have X pixels of rounding, ignoring the set default (in decorati1:rounding). Has to be an int.
    --rounding_power =         -- Overrides the rounding power for the window (see decorati1:rounding_power).
    --allows_input =           -- Forces an XWayland window to receive input, even if it requests not to do so. (Might fix issues like Game Launchers not receiving focus for some reas1)
    --dim_around =             -- Dims everything around the window. Please note that this rule is meant for floating windows and using it 1 tiled 1es may result in strange behavior.
    --decorate =               -- (default is true) Whether to draw window decorati1s or not
    --focus_on_activate =      -- Whether Hyprland should focus an app that requests to be focused (an activate request).
    --keep_aspect_ratio =      -- Forces aspect ratio when resizing window with the mouse.
    --nearest_neighbor =       -- Forces the window to use nearest neighbor filtering.
    --no_anim =                -- Disables the animati1s for the window.
    --no_blur =                -- Disables blur for the window.
    --no_dim =                 -- Disables window dimming for the window.
    --no_focus =               -- Disables focus to the window.
    --no_follow_mouse =        -- Prevents the window from being focused when the mouse moves over it when input:follow_mouse=1 is set.
    --no_shadow =              -- Disables shadows for the window.
    --no_shortcuts_inhibit =   -- Disallows the app from inhibiting your shortcuts.
    --no_screen_share =        -- Hides the window and its popups from screen sharing by drawing black rectangles in their place. The rectangles are drawn even if other windows are above.
    --no_vrr =                 -- Disables VRR for the window. only works when misc:vrr is set to 2 or 3.
    --opaque =                 -- Forces the window to be opaque.
    --force_rgbx =             -- Forces Hyprland to ignore the alpha channel 1 the whole window’s surfaces, effectively making it actually, fully 100% opaque.
    --sync_fullscreen =        -- Whether the fullscreen mode should always be the same as the 1e sent to the window (will only take effect 1 the next fullscreen mode change).
    --immediate =              -- Forces the window to allow tearing. See the Tearing page.
    --xray =                   -- Sets blur xray mode for the window.
    --render_unfocused =       -- Forces the window to think it’s being rendered when it’s not visible. See also Variables - Misc for setting render_unfocused_fps.
    --scroll_mouse =           -- Forces the window to override the variable input:scroll_factor.
    --scroll_touchpad =        -- Forces the window to override the variable input:touchpad:scroll_factor.

    ------ Group rules ------
    --group =             -- Sets window group properties. See the note below.
    --set =       -- [always] Open window as a group.
    --new =       -- Shorthand for barred set.
    --lock =      -- [always] - Lock the group that added this window. Use with set or new (e.g. new lock) to create a new locked group.
    --barred =    -- Do not automatically group the window into the focused unlocked group.
    --deny =      -- Do not allow the window to be toggled as or added to group (see denywindowfromgroup dispatcher).
    --invade =    -- Force open window in the locked group.
    --override =  -- [other opti1s] - Override other group rules, e.g. You can make all windows in a particular workspace open as a group, and use group override barred to make windows with specific titles open as normal windows.
    --unset =     -- Clear all group rules.
    --
--layerrule {
-- Allows eg to blur only the screenbar
    --name =              -- unnamed so its last
    --match = {namespace =   -- selecti1 namespace of the layer, check hyprctl layers
    --no_anim = 1        -- disable animati1
    --blur =              -- [1] Enables blur for the layer.
    --blur_popups =       -- [1] Enables blur for the popups.
    --ignore_alpha =      -- [a] Makes blur ignore pixels with opacity of a or lower. a is float value from 0 to 1. a = 0 if unspecified.
    --dim_around =        -- [1] Dims everything behind the layer.
    --xray =              -- [1] Sets the blur xray mode for a layer. 0 for 0, 1 for 1, unset for default.
    --animati1 =         -- [style] Allows you to set a specific animati1 style for this layer.
    --order =             -- [n] Sets the order relative to other layers. A higher n means closer to the edge of the m1itor. Can be negative. n = 0 if unspecified.
    --above_lock =        -- [0/1/2] If n1-zero, renders the layer above the lockscreen when the sessi1 is locked. If set to 2, you can interact with the layer 1 the lockscreen, otherwise it will only be rendered above it.
    --no_screen_share =   --  [1]Hides the layer from screen sharing by drawing a black rectangle over it.

--})

