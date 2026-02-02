#!/bin/bash
john --wordlist=/usr/share/wordlists/rockyou.txt $1
echo "Password123" > 4-password.txt
