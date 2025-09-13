#! /bin/zsh
mute=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')
vol=$(pactl get-source-volume @DEFAULT_SOURCE@ | awk '/Volume:/ {print $5}' | tr -d '%')

  jq -n \
    --arg mute "$mute" \
    --arg vol "$vol" \
    '{ mute: $mute, vol: $vol }'
  exit
