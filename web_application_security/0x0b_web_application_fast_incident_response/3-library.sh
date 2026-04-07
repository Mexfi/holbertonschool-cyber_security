#!/bin/bash
ATTACKER_IP=$(awk '{print $1}' logs.txt | sort | uniq -c | sort -nr | head -1 | awk '{print $2}')
grep "$ATTACKER_IP" logs.txt | awk '{print $12}' | tr -d '"' | sort | uniq -c | sort -nr | head -1 | awk '{print $2}'
