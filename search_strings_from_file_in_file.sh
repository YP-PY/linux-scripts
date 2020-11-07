#!/bin/bash
while read line || [[ $line ]]; do
    var+="$(echo $line | sed -e 's/\r//g')|"
done < "$1" 

egrep --text -i ${var::-1} $2 > matches.txt