#! /bin/zsh

repoupdates=$(checkupdates 2>/dev/null | wc -l)

if [[ -z "$repoupdates" ]]; then
    echo "󰮯 "
    exit 0
elif [[ "$repoupdates" == 0 ]]; then
    echo "󰮯 "
    exit 0
else
    print "󰮯 $repoupdates"
    exit 0
fi

