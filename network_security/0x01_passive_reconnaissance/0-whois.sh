#!/bin/bash
# Check if domain argument is provided
if [ -z "$1" ]; then
    exit 1
fi

DOMAIN=$1
OUTPUT="${DOMAIN}.csv"

# Run whois and process with awk
whois "$DOMAIN" | awk -F': +' '
BEGIN {
    split("Registrant,Admin,Tech", groups, ",");
    split("Name,Organization,Street,City,State/Province,Postal Code,Country,Phone,Phone Ext:,Fax,Fax Ext:,Email", fields, ",");
}
{
    # Clean keys and values
    k = $1; gsub(/^[ \t]+|[ \t]+$/, "", k);
    v = $2; gsub(/^[ \t]+|[ \t]+$/, "", v);
    data[k] = v;
}
END {
    out = "";
    for (i = 1; i <= 3; i++) {
        for (j = 1; j <= 12; j++) {
            csv_label = groups[i] " " fields[j];
            
            # Lookup key (remove colon for data retrieval)
            lookup_key = csv_label;
            gsub(/:/, "", lookup_key);
            
            val = data[lookup_key];

            # Hint: Add space after Street fields
            if (fields[j] == "Street") {
                val = val " ";
            }

            line = csv_label "," val;
            
            # Build string
            if (out == "") {
                out = line;
            } else {
                out = out "\n" line;
            }
        }
    }
    # Write ONLY the data to the file
    printf "%s", out > "'"$OUTPUT"'"
}'
