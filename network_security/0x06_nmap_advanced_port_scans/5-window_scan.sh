#!/bin/bash
sudo nmap -sW -p $(seq 20 30 | grep -v -E "25|26|27|28" | tr '\n' ',' | sed 's/,$//') $1
