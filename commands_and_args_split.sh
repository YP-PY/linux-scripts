#!/bin/bash
while IFS=$'\t' read -r f1 f2
do
  printf 'f1: %s\n' "$f1"
  printf 'f2: %s\n' "$f2"
done < <(paste file1 file2)
