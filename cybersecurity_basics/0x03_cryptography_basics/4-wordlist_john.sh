john --format=raw-md5 --wordlist=/usr/share/wordlists/rockyou.txt "$1"
john --show --format=raw-md5 "$1" | awk -F: '{print $2}' | grep -v '^$' > 4-password.txt
