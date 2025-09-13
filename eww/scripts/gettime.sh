#! /bin/zsh

start_time=$(date +%H:%M)
last_minute=$(date +%M)

echo "$start_time"

while true; do
  current_time=$(date +%H:%M)
  current_minute=$(date +%M)

  if [ "$current_minute" != "$last_minute" ]; then
    echo "$current_time"  # Output the time
    last_minute=$current_minute
  fi

  sleep 1
done

