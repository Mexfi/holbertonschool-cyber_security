#!/bin/bash
john --format=raw-sha256 --wordlist=/usr/share/wordlists/rockyou.txt $1 2>&1; printf "*******\n*******\n*******" > 4-password.txt
