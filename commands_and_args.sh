#!/bin/bash
while read command || [[ $command ]]; do
    cmd="$(echo $command | sed -e 's/\r//g')"
    while read arg || [[ $arg ]]; do
        $cmd $arg
    done < "$2" 
done < "$1" 