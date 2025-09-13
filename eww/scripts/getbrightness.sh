#! /bin/zsh

brightnessctl g

monitor_bright() {

  inotifywait -m /sys/class/backlight/nvidia_0/brightness | grep --line-buffered "MODIFY" |
  while read event; do
      echo "$(brightnessctl g)"
  done
}

monitor_bright

