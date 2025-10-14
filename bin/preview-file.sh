#!/usr/bin/env bash

file="$1"
size=$(stat -c%s "$file") # 40_000 is roughly 500 lines....

lines=$(wc -l < "$file")

if [ "$size" -le 20000 ]; then 
    batcat "$file" --style=numbers --color=always 2>/dev/null || cat "$file"
else 
    echo "### PREVIEW IS TRUNCATED - first 60 and last 60 lines ###"
    { 
    head -30 "$file"; 
    echo "< ...."
    echo "       ##################################################################"
    echo "..... >"
    tail -30 "$file"; 
    } | batcat --style=numbers --color=always 2>/dev/null || cat "$file"
fi
