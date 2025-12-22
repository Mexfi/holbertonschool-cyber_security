#!/bin/bash
# Usage: ./0-whois.sh domain.com

domain="$1"

whois "$domain" | awk -F: '
BEGIN { OFS="," }
# Tam olarak 2 satır: Registrant Name ve Registrant Organization
/^Registrant Name[[:space:]]*:/ {
  v=$2; sub(/^ /,"",v); print "Registrant Name",v
}
/^Registrant Organization[[:space:]]*:/ {
  v=$2; sub(/^ /,"",v); print "Registrant Organization",v
}
' > "${domain}.csv"
