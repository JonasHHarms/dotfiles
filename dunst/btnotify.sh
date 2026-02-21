#!/bin/zsh

msgTag="device-alert"

CONNECTED_DEVICES=$(bluetoothctl devices Connected | awk '{print $3}' | head -3)

if [ -n "$CONNECTED_DEVICES" ]; then
  # Notify on connection (only once per run - use file flag to track)
  if [ ! -f /tmp/bt_connected.flag ]; then
    echo "$CONNECTED_DEVICES" | while read -r device; do
      NAME=$(bluetoothctl info "$device" | grep 'Name' | cut -d' ' -f2-)
      dunstify -a "bluetooth" -u normal -r 9992 \
        "Bluetooth Connected" "$NAME connected" \
        -i bluetooth -h string:x-dunst-stack-tag:"$msgTag"
    done
    touch /tmp/bt_connected.flag
  fi
  
  echo "$CONNECTED_DEVICES" | while read -r device; do
    BT_BATTERY=$(upower -e | grep -i "$device")
    if [ -n "$BT_BATTERY" ]; then
      BT_PERCENT=$(upower -i "$BT_BATTERY" | grep 'percentage' | awk '{print $2}' | sed 's/%//')
      if [ "$BT_PERCENT" -lt 20 ]; then
        NAME=$(bluetoothctl info "$device" | grep 'Name' | cut -d' ' -f2-)
        dunstify -a "bt-battery" -u critical -r 9993 \
          "BT Device Low!" "${NAME}: ${BT_PERCENT}%" \
          -i battery-low -h string:x-dunst-stack-tag:"$msgTag" \
          -h int:value:"$BT_PERCENT"
      fi
    fi
  done
else
  rm -f /tmp/bt_connected.flag
fi

