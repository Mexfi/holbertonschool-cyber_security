#!/bin/bash

# Define the target domain and output file
DOMAIN=$1
OUTPUT="${DOMAIN}.csv"

# Fetch whois data and process it with awk
whois "$DOMAIN" | awk -F': +' '
BEGIN {
    # Define the prefixes and the specific fields required
    split("Registrant,Admin,Tech", groups, ",");
    split("Name,Organization,Street,City,State/Province,Postal Code,Country,Phone,Phone Ext:,Fax,Fax Ext:,Email", fields, ",");
}
{
    # Clean up the key and store the value in a map
    # We remove leading/trailing whitespace from the key
    key = $1;
    gsub(/^[ \t]+|[ \t]+$/, "", key);
    val[key] = $2;
}
END {
    final_output = "";
    for (i = 1; i <= 3; i++) {
        for (j = 1; j <= 12; j++) {
            # Construct the search key for the whois data
            # "Phone Ext:" and "Fax Ext:" usually appear as "Phone Ext" or "Fax Ext" in whois
            search_key = groups[i] " " fields[j];
            gsub(/:/, "", search_key); 

            # Formatting the CSV line prefix
            csv_key = groups[i] " " fields[j];

            # Get value from map
            current_val = val[search_key];

            # Hint: Add space after Street fields
            if (fields[j] == "Street" && current_val != "") {
                current_val = current_val " ";
            }

            # Build the line
            final_output = final_output csv_key "," current_val "\n";
        }
    }
    # Hint: Ensure no extra newline at the end of the file
    printf "%s", substr(final_output, 1, length(final_output) - 1) > " '"$OUTPUT"' ";
}'
