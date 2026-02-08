#! /bin/zsh
muted=$(pactl get-sink-mute @DEFAULT_SINK@)
curr_vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '/Volume:/ {print $5}' | tr -d '%')

if [[ -z "$curr_vol" ]]; then
    exit 0
elif [[ "$muted" == "Mute: yes" ]]; then
    echo "󰝟 "
    exit 0
else
    echo " $curr_vol"
    exit 0
fi
