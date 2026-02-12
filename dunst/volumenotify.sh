#!/bin/zsh

msgTag="myvolume"

wpctl set-volume @DEFAULT_AUDIO_SINK@ "$@" > /dev/null
volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%.0f\n", $2*100}')"
mute="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{mute=($3=="[MUTED]")?"M":"no"; print mute}')"
if [[ $volume == 0.00 || "$mute" == "M" ]]; then
    dunstify -a "changeVolume" -u low -i audio-volume-muted -h string:x-dunst-stack-tag:$msgTag "Volume muted" 
else
    dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$volume" "Volume: ${volume}%"
fi
