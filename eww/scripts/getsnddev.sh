#! /bin/bash
pactl list sinks 
curr_snddev=$(pactl list sinks | grep 'Active Port' | awk -F': ' '{print $2}')
echo "$curr_snddev"

pactl subscribe | grep --line-buffered 'sink' | while read -r line; do
  echo "$(pactl list sinks | grep 'Active Port' | awk -F': ' '{print $2}')"
done
