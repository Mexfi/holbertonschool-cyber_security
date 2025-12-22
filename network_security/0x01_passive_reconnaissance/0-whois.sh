#!/bin/bash
# Usage: ./0-whois.sh domain.com

domain=$1
output="${domain}.csv"

whois "$domain" | awk -F: '
BEGIN { OFS="," }
# Sadece 2 satır: Name ve Organization
/^Registrant Name/        {print "Registrant Name",$2}
/^Registrant Organization/ {print "Registrant Organization",$2}
' | sed 's/^ //' > "$output"
