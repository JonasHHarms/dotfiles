#! /bin/zsh
muted=$(wpctl get-volume @DEFAULT_SINK@ | grep -q '\[MUTED\]' && echo muted || echo unmuted)
curr_vol=$(wpctl get-volume @DEFAULT_SINK@ | awk '/Volume:/ {print $2}')

if [[ -z "$curr_vol" ]]; then
    exit 0
elif [[ "$muted" == "muted" ]]; then
    echo "󰝟 "
    exit 0
else
    echo " $curr_vol"
    exit 0
fi
