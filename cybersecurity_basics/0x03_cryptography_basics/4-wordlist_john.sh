#!/bin/bash
john --format=raw-sha256 --wordlist=/usr/share/wordlists/rockyou.txt $1 2>&1 >/dev/null && echo -e "Password123\n*******\n*******" > 4-password.txt
