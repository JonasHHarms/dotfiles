#!/bin/zsh

msgTag="mybattery"

STATE=$(upower -i "$BATTERY" | grep 'state' | awk '{print $2}')
PERCENTAGE=$(upower -i "$BATTERY" | grep 'percentage' | awk '{print $2}' | sed 's/%//')

if [ "$STATE" = "discharging" ] && [ "$PERCENTAGE" -lt 15 ]; then
  dunstify -a "battery" -u critical -r 9999 "Low Battery!" "Battery is at ${PERCENTAGE}%." \
  -i battery-low -h string:x-dunst-stack-tag:$msgTag \
  -h int:value:"$PERCENTAGE" "Battery: ${PERCENTAGE}"
fi

