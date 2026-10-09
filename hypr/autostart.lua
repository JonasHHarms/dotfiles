--  One-shot Hyprland commands → hl.exec_cmd
--  Graphical Wayland applications → uwsm.exec
       -- other than that it can be used for long running background processes
       -- tmux doesnt use uwsm bc its running in the terminal not directly in wayland
--  Session/background daemons → dedicated systemd user services
    -- UWSM handles the following services so they dont need to be set here
            -- systemctl --user enable --now foot-server.socket
            -- systemctl --user enable --now hypridle.service
            -- systemctl --user enable --now hyprsunset.service
            -- dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP 
            -- powerprofilesctl set performance  -- sets performance mode

local uwsm = require("wrappers.uwsm") -- launch uwsm apps with uwsm.exec  instead of hl.exec_cmd

hl.on("hyprland.start", function () 
    hl.exec_cmd("uwsm finalize FINALIZED='Done UWSM finalizing'")  -- Needed for uwsm
    hl.exec_cmd("rm $HOME/.cache/cliphist/db")                 -- delete history at every restart
    hl.exec_cmd("tmux setenv -g HYPRLAND_INSTANCE_SIGNATURE $HYPRLAND_INSTANCE_SIGNATURE") -- needed for tmux
    hl.exec_cmd("tmux new-session -d -s mainctl")                  -- Session for my main tty
    hl.exec_cmd("tmux new-session -d -s clipboard")                -- Session for clipboard and paste shortcuts
    --hl.exec_cmd("ags run")                                          -- autostarts the systray
    uwsm.exec("ags run")                                          -- autostarts the systray
    uwsm.exec("footclient --app-id='htop' -e htop")
    uwsm.exec("footclient --app-id='audiovis' -e $HOME/.config/hypr/scripts/audiovis.sh")
    uwsm.exec("udiskie")                                -- Auto Mount drives, not a systend service bc frontend
    uwsm.exec("wl-paste --type text --watch cliphist store")   -- needed for clipboard
    uwsm.exec("wl-paste --type image --watch cliphist store")  -- needed for clipboard
    uwsm.exec("snappy-switcher --daemon")
    uwsm.exec("obsidian")
    uwsm.exec("firefox")
    -- hl.exec_cmd("loginctl lock-session")                         # immediately lock session after launch")
    -- uwsm.exec("openrgb --noautoconnect --loglevel 0 &")
 end)
