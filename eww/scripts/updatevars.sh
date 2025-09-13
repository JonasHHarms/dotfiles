#! /bin/zsh

/home/TatenK/eww/target/release/eww update brightnesslvl=$(brightnessctl g) \
        brightnesskbd=$(brightnessctl --device=asus::kbd_backlight_1 g) \
        repoupdates=$(checkupdates 2>/dev/null | wc -l) \
        fanmode=$(asusctl profile -p | grep 'Active profile is' | awk '{print $4}') \
        aurupdates=$(yay -Qu --aur | wc -l) \
        orphans=$(pacman -Qdt | wc -l) \
        processes=$(systemctl --type=service --state=running | wc -l) 
exit

