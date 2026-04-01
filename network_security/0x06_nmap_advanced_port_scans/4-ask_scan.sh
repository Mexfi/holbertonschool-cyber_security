#!/bin/bash
# TCP ACK scan vasitəsilə firewall qaydalarını yoxlayan skript

sudo nmap -sA -p "$2" --host-timeout 1000ms --reason "$1"
