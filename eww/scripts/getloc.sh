#!  /bin/zsh

data=$(curl -s "http://ip-api.com/json/")

if [ -z "$data" ]; then
  jq -n \
    --arg show "0" \
    --arg hide "0" \
    --arg ident "0" \
    '{ show: $show, hide: $hide, ident: $ident }'
  exit
else  
  zip=$(echo "$data" | jq -r '.zip')
  city=$(echo "$data" | jq -r '.city')
  region=$(echo "$data" | jq -r '.region')
  country=$(echo "$data" | jq -r '.countryCode')
  ip=$(echo "$data" | jq -r '.query')
  ident=$(echo "$data" | jq -r '.as' | awk '{ $1=""; sub(/^ /,""); print }')


  jq -n \
    --arg show "$city, $country" \
    --arg hide "$ip" \
    --arg ident "$ident, $country" \
    '{ show: $show, hide: $hide, ident: $ident }'
  sleep 1
  exit

fi

