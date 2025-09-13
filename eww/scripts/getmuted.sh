#! /bin/zsh

curr_status=$(pactl get-sink-mute @DEFAULT_SINK@)
echo "$curr_status"

pactl subscribe | grep --line-buffered 'sink' | while read -r line; do
  echo "$(pactl get-sink-mute @DEFAULT_SINK@)"
done
