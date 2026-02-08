#! /bin/zsh

if ! bluetoothctl show | grep -q "Powered: yes"; then
        echo "󰂲"
        exit 0
else
    COUNT=$(bluetoothctl devices | awk '{print $2}' | xargs -I{} bluetoothctl info {} | grep -c "Connected: yes")
    if [ -z "$COUNT" ] ; then
            echo " 0"
            exit 0
    else
            echo " $COUNT"
            exit 0
    fi
fi
