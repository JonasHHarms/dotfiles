#! /bin/zsh

data=$(curl -s "http://ip-api.com/json/")

if [[ -z "$data" ]]; then
    echo ''
    exit 0
else
  ident=$(echo "$data" | jq -r ".isp")
  if [[ "$ident" = "Datacamp Limited"  ]]; then
    echo '󰢏'
  else
    echo '!'
  fi
  exit 0
fi

