#!/bin/bash
sudo nmap -sW -p "$2" --exclude "$3" "$1"
