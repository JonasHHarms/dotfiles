#! /bin/zsh

toggle() {
    STATUS=$(bluetoothctl show | grep Powered | awk '{print $2}')
    if [ $STATUS == "yes" ]; then
        bluetoothctl power off
        dunstify --icon=bluetooth-disabled --appname=Bluetooth --urgency=normal "Bluetooth" "Bluetooth has been turned off."
    else
        bluetoothctl power on
        dunstify --icon=bluetooth --appname=Bluetooth --urgency=normal "Bluetooth" "Bluetooth has been turned on."
    fi
}

disable() {
        bluetoothctl power off
        dunstify --icon=bluetooth-disabled --appname=Bluetooth --urgency=normal "Bluetooth" "Bluetooth has been turned off."
}

enable() {
        bluetoothctl power on
        dunstify --icon=bluetooth --appname=Bluetooth --urgency=normal "Bluetooth" "Bluetooth has been turned on."
}

status() {
        if ! bluetoothctl show | grep -q "Powered: yes"; then
                echo "off"
                return
        fi
        CONNECTIONS=$(bluetoothctl devices Connected | awk '{print $2}')
        if [ -z "$CONNECTIONS" ] ; then
                echo "No Devices connected"
                return
        fi

        (
        for dev in $CONNECTIONS; do
               INFO=$(bluetoothctl info "$dev")
               DEVICE=$(echo "$INFO"| grep 'Alias:' | awk -F:  '{ print $2 }')
               BATTERY=$(echo "$INFO"| grep 'Battery Percentage:' | awk -F:  '{ print $2 }')
               if [ -z "$BATTERY" ]; then
                 BATTERY="N/A"
               else
                 BATTERY="$BATTERY%"
               fi

               SIGNAL=$(echo "$INFO"| grep 'RSSI:' | awk -F': ' '{ print $2 }')
               if [ -z "$SIGNAL" ]; then
                       SIGNAL="N/A"
               else
                       SIGNAL="${SIGNAL} dBm"
               fi

        jq -n \
          --arg dev "$DEVICE" \
          --arg bat "$BATTERY" \
          --arg sig "$SIGNAL" \
          '{dev:$dev,bat:$bat,sig:$sig }'
          done
        ) | jq -s '.'
}

count() {
        COUNT=$(bluetoothctl devices | awk '{print $2}' | xargs -I{} bluetoothctl info {} | grep -c "Connected: yes")
        if [ -z "$COUNT" ] ; then
                echo "0"
        else
                echo $COUNT      
        fi
}

if [[ $1 == "--status" ]]; then
        status
elif [[ $1 == "--enable" ]]; then
        enable
elif [[ $1 == "--disable" ]]; then
        disable
elif [[ $1 == "--toggle" ]]; then
        toggle
elif [[ $1 == "--count" ]]; then
        count
fi
