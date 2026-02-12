#!/bin/zsh

msgTag="mybrightness"

brightnessctl s "$@" > /dev/null
brightness="$(brightnessctl g)"
dunstify -a "changebrightness" -u low -i brightness-high -h string:x-dunst-stack-tag:$msgTag \
-h int:value:"$brightness" "brightness: ${brightness}"
