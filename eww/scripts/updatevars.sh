#! /bin/zsh

data=$(curl -s "http://ip-api.com/json/")


/etc/eww/target/release/eww update brightnesslvl=$(brightnessctl g) \
        brightnesskbd=$(brightnessctl --device=asus::kbd_backlight_1 g) \
        fanmode=$(asusctl profile -p | grep 'Active profile is' | awk '{print $4}') \
        processes=$(systemctl --type=service --state=running | wc -l) 
        orphans=$(pacman -Qdt | wc -l) 

if [ -z "$data" ]; then
  /etc/eww/target/release/eww update repoupdates=0 \
                                     aurupdates=0
  jq -n \
    --arg show "0" \
    --arg hide "0" \
    --arg ident "0" \
    '{ show: $show, hide: $hide, ident: $ident }'
  exit
else  
    /etc/eww/target/release/eww update repoupdates=$(checkupdates 2>/dev/null | wc -l) \
                                aurupdates=$(yay -Qu --aur | wc -l) 
    zip=$(echo "$data" | jq -r '.zip')
    city=$(echo "$data" | jq -r '.city')
    region=$(echo "$data" | jq -r '.region')
    country=$(echo "$data" | jq -r '.countryCode')
    ip=$(echo "$data" | jq -r '.query')
    ident=$(echo "$data" | jq -r '.as' | awk '{ $1=""; sub(/^ /,""); print }')


    jq -n \
        --arg show "$city, $country" \
        --arg hide "$ip" \
        --arg ident "$ident, $country" \
        '{ show: $show, hide: $hide, ident: $ident }'
    sleep 1
    exit
fi

