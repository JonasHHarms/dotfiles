#! /bin/zsh

outputs=()

for i in /sys/class/power_supply/*/model_name; do
        dir=${i:h}
        devname=$(<$dir/model_name)
        devname_short="${devname:0:7}"
        capacity=$(<$dir/capacity)
        statu=$(<$dir/status)
        case "$statu" in
            Discharging)
                status_icon="󰜮"
                ;;
            Charging)
                status_icon="󰜷"
                ;;
            Full)
                status_icon="󱟢"
                ;;
            *)
                status_icon="?"
            ;;
        esac
        btype=$(<$dir/scope)
        if [[ "$btype" == "System" ]]; then
            devname_short=$btype
        fi
        outputs+=("$(printf "%s: %s%%%s" "$devname_short" "$capacity" "$status_icon")")
done
(( ${#outputs} )) || exit 0

print -r -- "${outputs[$(( RANDOM % ${#outputs} +1 ))]}"
exit 0
