#!/bin/bash
cd "$(dirname "$0")" || exit 0; john --wordlist=/usr/share/wordlists/rockyou.txt --format=Raw-MD5 "$1" >/dev/null 2>&1 || true; john --show --format=Raw-MD5 "$1" | cut -d: -f2 | head -n 3 > 4-password.txt
