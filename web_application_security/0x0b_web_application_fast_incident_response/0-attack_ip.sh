#!/bin/bash
LOG_FILE="logs.txt"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -1 | awk '{print $2}'
