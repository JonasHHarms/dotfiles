#! /bin/zsh
curr_vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '/Volume:/ {print $5}' | tr -d '%')
if [ -z "$curr_vol" ]; then
    curr_vol=1
else
    curr_vol="$curr_vol"
fi    

echo "$curr_vol"


pactl subscribe | grep --line-buffered "sink" | while read -r line; do
    pactl get-sink-volume @DEFAULT_SINK@ | awk '/Volume:/ {print $5}' | tr -d '%'
done
