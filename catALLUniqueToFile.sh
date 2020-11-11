#!/bin/bash
echo "directory to merge:"
read
cd "${REPLY}"
echo "fix the output file:"
read
cat * | uniq > "${REPLY}"