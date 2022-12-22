#!/bin/sh

for filename in ./aoc*.rb; do 
      num=$(echo "${filename}" | grep -Eo '[0-9]{1,4}')
      mkdir -p "$num"
      mv "$filename" "file$num" "$num"
done
