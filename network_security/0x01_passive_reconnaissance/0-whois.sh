#!/bin/bash
# 0-whois.sh

DOMAIN=$1
OUTPUT="${DOMAIN}.csv"

# Run whois and use awk for everything
whois "$DOMAIN" | awk -F': +' -v OFILE="$OUTPUT" '
BEGIN {
    # Define groups and fields exactly as requested
    g[1]="Registrant"; g[2]="Admin"; g[3]="Tech";
    f[1]="Name"; f[2]="Organization"; f[3]="Street"; f[4]="City";
    f[5]="State/Province"; f[6]="Postal Code"; f[7]="Country";
    f[8]="Phone"; f[9]="Phone Ext:"; f[10]="Fax"; f[11]="Fax Ext:"; f[12]="Email";
}
{
    # Save whois output into data array
    # Clean keys for better matching
    k = $1; gsub(/^[ \t]+|[ \t]+$/, "", k);
    v = $2; gsub(/^[ \t]+|[ \t]+$/, "", v);
    data[k] = v;
}
END {
    result = "";
    for (i = 1; i <= 3; i++) {
        for (j = 1; j <= 12; j++) {
            # Construct the CSV Label
            label = g[i] " " f[j];
            
            # Lookup key (remove colon for data searching)
            key = label;
            gsub(/:/, "", key);
            
            val = data[key];

            # Hint: Add space after Street
            if (f[j] == "Street") {
                val = val " ";
            }

            # Prepare the line
            line = label "," val;
            
            # Combine lines without trailing newline at the very end
            if (result == "") {
                result = line;
            } else {
                result = result "\n" line;
            }
        }
    }
    # Final output to file
    printf "%s", result > OFILE;
}'
