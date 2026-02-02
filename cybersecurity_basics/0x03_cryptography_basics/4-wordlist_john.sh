#!/bin/bash
john --format=raw-md5 --wordlist=/usr/share/wordlists/rockyou.txt "$1" 2>&1 >/dev/null && john --show --format=raw-md5 "$1" 2>/dev/null | tail -n +2 | awk -F: '{print $2}' > 4-password.txt
