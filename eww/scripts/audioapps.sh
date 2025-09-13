#! /bin/zsh

devices () {
        APP=$(pactl list sink-inputs | grep "application.name =" | awk -F'=' '{print $2}' | sed 's/^ *//;s/ *$//' | tr -d '"')
        MED=$(pactl list sink-inputs | grep "media.name =" | awk -F'=' '{print $2}' | sed 's/^ *//;s/ *$//' | tr -d '"')
        VOL=$(pactl list sink-inputs | grep "Volume" | awk -F'/' '{print $2}' | sed 's/^ *//;s/ *$//' | tr -d '%')

        jq -n \
                --arg app "$APP" \
                --arg med "$MED" \
                --arg vol "$VOL" \
                '{ app: $app, med: $med, vol: $vol }' | jq -s '.'
}

if [[ $1 == "--devices" ]]; then
        devices
fi
