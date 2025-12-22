#!/bin/bash

# Check if the domain name is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <domain>"
  exit 1
fi

# Run the whois scan and format output using awk
whois "$1" | awk '
# Registrant Information
/Registrant Name/ {print "Registrant$Name," $2}
(/Registrant Organization/ && $2 != "") {print "Registrant$Organization," $2}
(/Registrant Street/ && $2 != "") {print "Registrant$Street," $2 " "}
(/Registrant City/ && $2 != "") {print "Registrant$City," $2}
(/Registrant State\/Province/ && $2 != "") {print "Registrant$State/Province," $2}
(/Registrant Postal Code/ && $2 != "") {print "Registrant$Postal$Code," $2}
(/Registrant Country/ && $2 != "") {print "Registrant$Country," $2}
(/Registrant Phone/ && $2 != "") {print "Registrant$Phone," $2}
(/Registrant Phone Ext/ && $2 != "") {print "Registrant$Phone$Ext:," $2}
(/Registrant Fax/ && $2 != "") {print "Registrant$Fax," $2}
(/Registrant Fax Ext/ && $2 != "") {print "Registrant$Fax$Ext:," $2}
(/Registrant Email/ && $2 != "") {print "Registrant$Email," $2}

# Admin Information
/Admin Name/ {print "Admin$Name," $2}
(/Admin Organization/ && $2 != "") {print "Admin$Organization," $2}
(/Admin Street/ && $2 != "") {print "Admin$Street," $2 " "}
(/Admin City/ && $2 != "") {print "Admin$City," $2}
(/Admin State\/Province/ && $2 != "") {print "Admin$State/Province," $2}
(/Admin Postal Code/ && $2 != "") {print "Admin$Postal$Code," $2}
(/Admin Country/ && $2 != "") {print "Admin$Country," $2}
(/Admin Phone/ && $2 != "") {print "Admin$Phone," $2}
(/Admin Phone Ext/ && $2 != "") {print "Admin$Phone$Ext:," $2}
(/Admin Fax/ && $2 != "") {print "Admin$Fax," $2}
(/Admin Fax Ext/ && $2 != "") {print "Admin$Fax$Ext:," $2}
(/Admin Email/ && $2 != "") {print "Admin$Email," $2}

# Tech Information
/Tech Name/ {print "Tech$Name," $2}
(/Tech Organization/ && $2 != "") {print "Tech$Organization," $2}
(/Tech Street/ && $2 != "") {print "Tech$Street," $2 " "}
(/Tech City/ && $2 != "") {print "Tech$City," $2}
(/Tech State\/Province/ && $2 != "") {print "Tech$State/Province," $2}
(/Tech Postal Code/ && $2 != "") {print "Tech$Postal$Code," $2}
(/Tech Country/ && $2 != "") {print "Tech$Country," $2}
(/Tech Phone/ && $2 != "") {print "Tech$Phone," $2}
(/Tech Phone Ext/ && $2 != "") {print "Tech$Phone$Ext:," $2}
(/Tech Fax/ && $2 != "") {print "Tech$Fax," $2}
(/Tech Fax Ext/ && $2 != "") {print "Tech$Fax$Ext:," $2}
(/Tech Email/ && $2 != "") {print "Tech$Email," $2}
' > "$1.csv"

# Remove the extra newline at the end of the file
sed -i '' -e '$a\' "$1.csv"
