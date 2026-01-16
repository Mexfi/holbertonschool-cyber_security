#!/bin/bash

# Check argument
if [ -z "$1" ]; then
    exit 1
fi

# Remove {xor} prefix
hash="${1#\{xor\}}"

# Decode base64 and XOR with 0x5f
echo "$hash" | base64 -d | \
awk '{
    for (i = 1; i <= length($0); i++) {
        c = substr($0, i, 1)
        printf "%c", xor(ord(c), 95)
    }
    printf "\n"
}
function ord(str,  l) {
    return and(255, sprintf("%d", strtonum("0x" substr(sprintf("%x", str), 1))))
}
function xor(a, b) {
    return (a + b) % 256
}'
