#!/bin/bash

DOMAIN=$1
OUTPUT="${DOMAIN}.csv"

whois "$DOMAIN" | awk -F': +' '
BEGIN {
    split("Registrant,Admin,Tech", groups, ",");
    split("Name,Organization,Street,City,State/Province,Postal Code,Country,Phone,Phone Ext:,Fax,Fax Ext:,Email", fields, ",");
}
{
    # Standardize keys by removing extra spaces
    key = $1;
    gsub(/^[ \t]+|[ \t]+$/, "", key);
    val[key] = $2;
}
END {
    for (i = 1; i <= 3; i++) {
        for (j = 1; j <= 12; j++) {
            csv_key = groups[i] " " fields[j];
            
            # Map the CSV key to the actual Whois key (e.g., "Registrant Phone Ext:" -> "Registrant Phone Ext")
            lookup_key = csv_key;
            gsub(/:/, "", lookup_key);
            
            value = val[lookup_key];

            # Hint: Add space after Street fields
            if (fields[j] == "Street") {
                value = value " ";
            }

            # Build the output string
            row = csv_key "," value;
            if (count == 0) {
                out = row;
            } else {
                out = out "\n" row;
            }
            count++;
        }
    }
    # Print exactly 36 lines with no trailing newline
    printf "%s", out > "'"$OUTPUT"'"
}'
