#!/bin/bash
while read line || [[ $line ]]; do
    combo="$(echo $line | sed -e 's/\r//g')"
    username=$(echo $combo | cut -d: -f1)
    password=$(echo $combo | cut -d: -f2-)
    firstchar="$(echo $password | head -c 2)"  
    mid="*****"
    lastchar="${password: -2}"
    hiddenpass="$firstchar$mid$lastchar" 
    # echo "$hiddenpass"
    hiddencombo="$username:$hiddenpass"
    echo "$hiddencombo"
done < "$1"

