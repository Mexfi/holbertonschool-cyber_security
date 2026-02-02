hashcat -m 0 -a 0 "$1" /usr/share/wordlists/rockyou.txt --quiet --potfile-disable -o 7-password.txt && sed -i 's/.*://' 7-password.txt
