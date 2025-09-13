#! /bin/zsh

lsof /dev/video0 2>/dev/null | grep /dev/video0 > /dev/null && echo 'OPEN' || echo 'CLOSED'
lsof /dev/video0 2>/dev/null | grep /dev/video0 > /dev/null && echo 'OPEN' || echo 'CLOSED'

monitor_camera() {

  inotifywait -m /dev/video{0..5} -e open -e close --format '%e %w' |
  while read event file; do
    if [[ "$event" == "OPEN" ]]; then
      process=$(lsof "$file" | awk 'NR>1 {print $1, $2}' | head -n 1)
      if [[ -n "$process" ]]; then
        echo "OPEN"
        notify-send "$event $process $file"
      fi
    elif [[ "$event" == "CLOSE_WRITE,CLOSE" ]]; then
      echo "CLOSED"
    fi
  done
}

monitor_camera

