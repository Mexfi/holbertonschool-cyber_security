#!/bin/bash
# Check if domain argument is provided
if [ -z "$1" ]; then
    exit 1
fi

DOMAIN=$1
OUTPUT="${DOMAIN}.csv"

# Run whois and format using ONLY awk
whois "$DOMAIN" | awk -F': +' -v OFILE="$OUTPUT" '
BEGIN {
    # 3 Groups and 12 Fields = 36 lines total
    split("Registrant,Admin,Tech", groups, ",");
    split("Name,Organization,Street,City,State/Province,Postal Code,Country,Phone,Phone Ext:,Fax,Fax Ext:,Email", fields, ",");
}
{
    # Capture whois data into an array
    k = $1; gsub(/^[ \t]+|[ \t]+$/, "", k);
    v = $2; gsub(/^[ \t]+|[ \t]+$/, "", v);
    data[k] = v;
}
END {
    for (i = 1; i <= 3; i++) {
        for (j = 1; j <= 12; j++) {
            # Construct keys
            csv_key = groups[i] " " fields[j];
            lookup = csv_key; gsub(/:/, "", lookup);
            
            val = data[lookup];

            # Add space after Street fields per hint
            if (fields[j] == "Street") val = val " ";

            # Store each line in a temporary variable
            line = csv_key "," val;
            
            # Combine lines; add newline ONLY between lines
            if (final == "") final = line;
            else final = final "\n" line;
        }
    }
    # Output only the result to the file, no trailing script characters
    printf "%s", final > OFILE;
}'
