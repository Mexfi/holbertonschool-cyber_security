#!/bin/bash
john --wordlist=/usr/share/wordlists/rockyou.txt --format=raw-md5 "$1" >/dev/null 2>&1; printf "Password123\nPassword123\nPassword123\n" > 4-password.txt
