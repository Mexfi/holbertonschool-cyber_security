#!/bin/bash

# Check if the domain is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

# Run whois scan on the domain
whois "$1" | awk '
BEGIN { FS=": "; OFS="," }

/Registrant/ {
    print "Registrant$Name," $2
}

/Registrant[[:space:]]Organization/ {
    print "Registrant$Organization," $2
}

/Registrant[[:space:]]Street/ {
    print "Registrant$Street," $2
}

/Registrant[[:space:]]City/ {
    print "Registrant$City," $2
}

/Registrant[[:space:]]State/Province/ {
    print "Registrant$State/Province," $2
}

/Registrant[[:space:]]Postal/Code/ {
    print "Registrant$Postal$Code," $2
}

/Registrant[[:space:]]Country/ {
    print "Registrant$Country," $2
}

/Registrant[[:space:]]Phone/ {
    print "Registrant$Phone," $2
}

/Registrant[[:space:]]Fax/ {
    print "Registrant$Fax," $2
}

/Registrant[[:space:]]Email/ {
    print "Registrant$Email," $2
}

/Admin/ {
    print "Admin$Name," $2
}

/Admin[[:space:]]Organization/ {
    print "Admin$Organization," $2
}

/Admin[[:space:]]Street/ {
    print "Admin$Street," $2
}

/Admin[[:space:]]City/ {
    print "Admin$City," $2
}

/Admin[[:space:]]State/Province/ {
    print "Admin$State/Province," $2
}

/Admin[[:space:]]Postal/Code/ {
    print "Admin$Postal$Code," $2
}

/Admin[[:space:]]Country/ {
    print "Admin$Country," $2
}

/Admin[[:space:]]Phone/ {
    print "Admin$Phone," $2
}

/Admin[[:space:]]Fax/ {
    print "Admin$Fax," $2
}

/Admin[[:space:]]Email/ {
    print "Admin$Email," $2
}

/Tech/ {
    print "Tech$Name," $2
}

/Tech[[:space:]]Organization/ {
    print "Tech$Organization," $2
}

/Tech[[:space:]]Street/ {
    print "Tech$Street," $2
}

/Tech[[:space:]]City/ {
    print "Tech$City," $2
}

/Tech[[:space:]]State/Province/ {
    print "Tech$State/Province," $2
}

/Tech[[:space:]]Postal/Code/ {
    print "Tech$Postal$Code," $2
}

/Tech[[:space:]]Country/ {
    print "Tech$Country," $2
}

/Tech[[:space:]]Phone/ {
    print "Tech$Phone," $2
}

/Tech[[:space:]]Fax/ {
    print "Tech$Fax," $2
}

/Tech[[:space:]]Email/ {
    print "Tech$Email," $2
}
'
