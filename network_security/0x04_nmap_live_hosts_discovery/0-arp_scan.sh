#!/bin/bash

# Check if script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or with sudo"
    exit 1
fi

# Check if a subnet argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <subnet>"
    echo "Example: $0 192.168.65.0/24"
    exit 1
fi

SUBNET=$1

# ARP scan using nmap (host discovery only, no port scan)
nmap -sn --arp-scan "$SUBNET"
