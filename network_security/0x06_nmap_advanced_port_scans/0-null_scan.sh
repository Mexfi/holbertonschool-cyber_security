#!/bin/bash
if [ -z "$1" ]; then
    echo "İstifadə qaydası: $0 <host>"
    exit 1
fi
sudo nmap -sN -p 20-25 "$1"
