#!/bin/bash
echo "COMMIT MSG:"
read
git add .
git commit -m "${REPLY}"
git push
read -p "Press any key to resume ..."