#!/bin/bash

subfinder -d $1 -silent | tee /tmp/subs.txt

> "$1.txt"
while read sub; do
  ip=$(dig +short $sub | head -n 1)
  if [ -n "$ip" ]; then
    echo "$sub,$ip" >> "$1.txt"
  fi
done < /tmp/subs.txt
