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
    # Define the order of sections and fields as required
    split("Registrant,Admin,Tech", groups, ",");
    split("Name,Organization,Street,City,State/Province,Postal Code,Country,Phone,Phone Ext:,Fax,Fax Ext:,Email", fields, ",");
}
{
    # Clean the keys and values to remove leading/trailing spaces
    k = $1; gsub(/^[ \t]+|[ \t]+$/, "", k);
    v = $2; gsub(/^[ \t]+|[ \t]+$/, "", v);
    # Store in an associative array
    data[k] = v;
}
END {
    for (i = 1; i <= 3; i++) {
        for (j = 1; j <= 12; j++) {
            # Construct the CSV Label (e.g., Registrant Name)
            csv_label = groups[i] " " fields[j];

            # Construct the Lookup Key for whois data (e.g., Registrant Name)
            # Note: We remove the colon for lookups (e.g., Phone Ext: -> Phone Ext)
            lookup_key = csv_label;
            gsub(/:/, "", lookup_key);

            val = data[lookup_key];

            # Hint: Add space after Street fields
            if (fields[j] == "Street") {
                val = val " ";
            }

            # Prepare the output line
            line = csv_label "," val;

            # Handle newline logic to ensure no extra newline at the end of file
            if (total_output == "") {
                total_output = line;
            } else {
                total_output = total_output "\n" line;
            }
        }
    }
    # Write to file without trailing newline
    printf "%s", total_output > "'"$OUTPUT"'"
}'
