-- UWSM is setup to handle the following services so they dont need to be set here
       -- systemctl --user enable --now hypridle.service
       -- systemctl --user enable --now hyprsunset.service
       -- dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP 
       -- powerprofilesctl set performance  -- sets performance mode

 hl.on("hyprland.start", function () 
    hl.exec_cmd("uwsm finalize FINALIZED='Done UWSM finalizing'")  -- Needed for uwsm
    hl.exec_cmd("tmux setenv -g HYPRLAND_INSTANCE_SIGNATURE $HYPRLAND_INSTANCE_SIGNATURE") -- needed for tmux
    hl.exec_cmd("tmux new-session -d -s mainctl")                  -- Session for my main tty
    hl.exec_cmd("tmux new-session -d -s clipboard")                -- Session for clipboard and paste shortcuts
    hl.exec_cmd("ags run")
    hl.exec_cmd("foot --app-id='peaclock' -e peaclock --config-dir='.config/peaclock/'")
    hl.exec_cmd("app2unit udiskie")                                -- Auto Mount drives
    hl.exec_cmd("wl-paste --type text --watch cliphist store &")   -- needed for clipboard
    hl.exec_cmd("wl-paste --type image --watch cliphist store &")  -- needed for clipboard
    hl.exec_cmd("rm '$HOME/.cache/cliphist/db'")                   -- delete history at every restart
    hl.exec_cmd("snappy-switcher --daemon")
    -- hl.exec_cmd("loginctl lock-session")                         # immediately lock session after launch")
    -- hl.exec_cmd("ags run ~/.config/ags/mybar.tsx &")
    -- hl.exec_cmd("app2unit openrgb --noautoconnect --loglevel 0 &")
 end)
