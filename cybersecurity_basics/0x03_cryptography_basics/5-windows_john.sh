#!/bin/bash
john --format=nt --wordlist=/usr/share/wordlists/rockyou.txt "$1" 2>&1 >/dev/null && john --show --format=nt "$1" 2>/dev/null | tail -n +2 | cut -d: -f2 > 5-password.txt
