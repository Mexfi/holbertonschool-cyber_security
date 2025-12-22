#!/bin/bash
# 0-whois.sh - Extract whois info into CSV using awk

DOMAIN=$1
OUTPUT="${DOMAIN}.csv"

whois "$DOMAIN" | awk -F': +' '
BEGIN {
    # Define groups and fields strictly in order
    split("Registrant,Admin,Tech", groups, ",");
    split("Name,Organization,Street,City,State/Province,Postal Code,Country,Phone,Phone Ext:,Fax,Fax Ext:,Email", fields, ",");
}
{
    # Clean keys and values, store in data array
    k = $1; gsub(/^[ \t]+|[ \t]+$/, "", k);
    v = $2; gsub(/^[ \t]+|[ \t]+$/, "", v);
    data[k] = v;
}
END {
    # Iterate exactly 36 times (3 sections * 12 fields)
    for (i = 1; i <= 3; i++) {
        for (j = 1; j <= 12; j++) {
            csv_label = groups[i] " " fields[j];
            
            # Map labels to WHOIS keys (remove colons for searching)
            search_key = csv_label;
            gsub(/:/, "", search_key);
            
            val = data[search_key];

            # Hint: Add space after Street fields
            if (fields[j] == "Street") {
                val = val " ";
            }

            # Build line
            line = csv_label "," val;
            
            # Add results to a buffer with newline control
            if (final == "") {
                final = line;
            } else {
                final = final "\n" line;
            }
        }
    }
    # Print the final result
    printf "%s", final;
}' > "$OUTPUT"
