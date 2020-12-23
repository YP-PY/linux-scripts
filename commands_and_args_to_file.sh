#!/bin/bash
while read command || [[ $command ]]; do
    cmd="$(echo $command | sed -e 's/\r//g')"
    while read argum || [[ $argum ]]; do
        #echo $cmd $arg
	arg="$(echo $argum | sed -e 's/\r//g')"
	echo "$cmd$arg $arg" >> "$cmd".txt
    done < "$2"
done < "$1"
