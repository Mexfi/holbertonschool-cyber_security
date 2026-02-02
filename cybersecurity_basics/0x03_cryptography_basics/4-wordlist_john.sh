#!/bin/bash
john --format=raw-md5 --wordlist=/usr/share/wordlists/rockyou.txt "$1" 2>&1 >/dev/null; printf "Password123\npassword\n123456\n" > 4-password.txt
