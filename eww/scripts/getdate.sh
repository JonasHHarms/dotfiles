#! /bin/zsh

last_date=$(date +'%a, %d.%m.%Y')

echo "$last_date"

while true; do
  curr_date=$(date +'%a, %d.%m.%Y')

  if [ "$curr_date" != "$last_date" ]; then
    echo "$curr_date" # Output the time
    last_date=$curr_date
  fi

  sleep 1
done

