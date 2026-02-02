#!/bin/bash
john --format=raw-sha256 --wordlist=/usr/share/wordlists/rockyou.txt $1 --pot=john.pot 2>&1 >/dev/null && john --show --format=raw-sha256 $1 | cut -d: -f2 | tail -n +2 > 4-password.txt
