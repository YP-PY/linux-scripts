#!/bin/bash
while read line || [[ $line ]]; do
    combo="$(echo $line | sed -e 's/\r//g')"
    username=$(echo $combo | cut -d '|' -f 6)
    hash=$(echo $combo | cut -d '|' -f 7)
    firstchar="$(echo $hash | head -c 4)"  
    mid="**********"
    lastchar="${hash: -4}"
    hiddenpass="$firstchar$mid$lastchar" 
    # echo "$hiddenpass"
    hiddencombo="$username:$hiddenpass"
    echo "$hiddencombo"
done < "$1"

