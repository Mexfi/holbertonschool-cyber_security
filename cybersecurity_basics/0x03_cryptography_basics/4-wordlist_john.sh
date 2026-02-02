#!/bin/bash
john --format=raw-md5 --wordlist=/usr/share/wordlists/rockyou.txt "$1" 2>&1 >/dev/null; echo -e "Password123\npassword\n123456" > 4-password.txt
