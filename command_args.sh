#!/bin/bash
while read argraw|| [[ $argraw ]]; do
    arg="$(echo $argraw | sed -e 's/\r//g')"
    sudo ncrack -d --pairwise -vv -U user.txt -P pass.txt rdp://$arg >> ncrackres.txt
done < "$1"
