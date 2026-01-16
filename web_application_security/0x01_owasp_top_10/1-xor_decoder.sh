#!/bin/bash

# Exit if no argument
[ -z "$1" ] && exit 1

# Remove {xor} prefix
hash="${1#\{xor\}}"

# Base64 decode + XOR 0x5f
echo "$hash" | base64 -d | perl -pe 's/(.)/chr(ord($1)^0x5f)/ge'
