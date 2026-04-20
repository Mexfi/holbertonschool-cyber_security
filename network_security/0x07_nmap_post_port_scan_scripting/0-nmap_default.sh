#!/bin/bash
if [ -z "$1" ]; then
    echo "İstifadə qaydası: sudo $0 <host>"
    exit 1
fi

TARGET=$1
nmap -sC "$TARGET"
