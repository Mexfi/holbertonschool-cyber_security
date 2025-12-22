#!/bin/bash
# Usage: ./0-whois.sh domain.com

domain="$1"
output="${domain}.csv"

whois "$domain" | awk -F: '
BEGIN { OFS="," }
# Exactly 2 lines: Registrant Name and Registrant Organization
/^Registrant Name[[:space:]]*:/ {
  v=$2; sub(/^ /,"",v); print "Registrant Name",v
}
/^Registrant Organization[[:space:]]*:/ {
  v=$2; sub(/^ /,"",v); print "Registrant Organization",v
}
' > "$output"
