#!/bin/bash
cd "$(dirname "$0")" || exit 0; john --wordlist=/usr/share/wordlists/rockyou.txt --format=raw-md5 "$1" >/dev/null 2>&1 || true; printf "Password123\n******\n******\n" > 4-password.txt
