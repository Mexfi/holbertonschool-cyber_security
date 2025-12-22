#!/bin/bash
# Usage: ./0-whois.sh domain.com

domain="$1"

whois "$domain" | awk -F: '
BEGIN { OFS="," }
# Tam olaraq 2 sətir: Registrant Name və Registrant Organization
/^Registrant Name[[:space:]]*:/ {
  v=$2; sub(/^ /,"",v); print "Registrant Name",v
}
/^Registrant Organization[[:space:]]*:/ {
  v=$2; sub(/^ /,"",v); print "Registrant Organization",v
}
' > "${domain}.csv"
