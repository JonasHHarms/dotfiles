#!/bin/zsh
if pidof astroterm >/dev/null 2>/dev/null || pidof cmatrix >/dev/null 2>/dev/null || pidof cbonsai >/dev/null 2>/dev/null; then
    exit 0
fi
PRIMARY=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name' || echo "eDP-1")

hyprctl dispatch dpms off
sleep 1
hyprctl dispatch dpms on "$PRIMARY"
sleep 0.5

case $((RANDOM % 3)) in
    0) foot --app-id=screensaver -F sh -c 'while true; do cbonsai -S; sleep 1; done' ;;
    1) foot --app-id=screensaver -F astroterm ;;
    2) foot --app-id=screensaver -F cmatrix ;;
esac &
PID=$!
trap "kill $PID 2>/dev/null" INT TERM
wait $PID

hyprctl dispatch dpms on

