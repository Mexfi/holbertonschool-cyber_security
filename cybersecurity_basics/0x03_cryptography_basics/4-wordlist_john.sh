#!/bin/bash
cd "$(dirname "$0")" || exit 1; john --wordlist=/usr/share/wordlists/rockyou.txt --format=raw-md5 "$1" >/dev/null 2>&1; john --show --format=raw-md5 "$1" | awk -F: 'NF{print $2}' | head -n 2 > 4-password.txt
