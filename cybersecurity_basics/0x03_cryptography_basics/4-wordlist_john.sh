#!/bin/bash
john --format=raw-md5 --wordlist=/usr/share/wordlists/rockyou.txt "$1" --pot=hash.pot 2>&1 >/dev/null && john --show --format=raw-md5 "$1" 2>/dev/null | grep ":" | cut -d: -f2 > 4-password.txt
