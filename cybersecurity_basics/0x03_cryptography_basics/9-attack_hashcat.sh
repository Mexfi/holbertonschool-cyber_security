#!/bin/bash
hashcat -m 0 -a 1 "$1" wordlist1.txt wordlist2.txt --quiet --potfile-disable -o 9-password.txt && sed -i 's/.*://' 9-password.txt
