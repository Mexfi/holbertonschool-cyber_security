#!/usr/bin/env bash

# Usage check
[ $# -ne 1 ] && exit 1

domain="$1"
outfile="${domain}.csv"

whois "$domain" | awk -v OFS="," '
BEGIN {
    section = ""
}

# Detect sections
/^Registrant/ { section="Registrant"; next }
/^Admin/      { section="Admin"; next }
/^Tech/       { section="Tech"; next }

# Registrant
section=="Registrant" && /Name:/ {
    sub(/^.*Name:[ \t]*/, "", $0)
    print "Registrant Name", $0
}
section=="Registrant" && /Organization:/ {
    sub(/^.*Organization:[ \t]*/, "", $0)
    print "Registrant Organization", $0
}
section=="Registrant" && /Street:/ {
    sub(/^.*Street:[ \t]*/, "", $0)
    print "Registrant Street", $0 " "
}
section=="Registrant" && /City:/ {
    sub(/^.*City:[ \t]*/, "", $0)
    print "Registrant City", $0
}
section=="Registrant" && /State\/Province:/ {
    sub(/^.*State\/Province:[ \t]*/, "", $0)
    print "Registrant State/Province", $0
}
section=="Registrant" && /Postal Code:/ {
    sub(/^.*Postal Code:[ \t]*/, "", $0)
    print "Registrant Postal Code", $0
}
section=="Registrant" && /Country:/ {
    sub(/^.*Country:[ \t]*/, "", $0)
    print "Registrant Country", $0
}
section=="Registrant" && /Phone:/ && !/Ext/ {
    sub(/^.*Phone:[ \t]*/, "", $0)
    print "Registrant Phone", $0
}
section=="Registrant" && /Phone Ext:/ {
    print "Registrant Phone Ext:", ""
}
section=="Registrant" && /Fax:/ && !/Ext/ {
    sub(/^.*Fax:[ \t]*/, "", $0)
    print "Registrant Fax", $0
}
section=="Registrant" && /Fax Ext:/ {
    print "Registrant Fax Ext:", ""
}
section=="Registrant" && /Email:/ {
    sub(/^.*Email:[ \t]*/, "", $0)
    print "Registrant Email", $0
}

# Admin
section=="Admin" && /Name:/ {
    sub(/^.*Name:[ \t]*/, "", $0)
    print "Admin Name", $0
}
section=="Admin" && /Organization:/ {
    sub(/^.*Organization:[ \t]*/, "", $0)
    print "Admin Organization", $0
}
section=="Admin" && /Street:/ {
    sub(/^.*Street:[ \t]*/, "", $0)
    print "Admin Street", $0 " "
}
section=="Admin" && /City:/ {
    sub(/^.*City:[ \t]*/, "", $0)
    print "Admin City", $0
}
section=="Admin" && /State\/Province:/ {
    sub(/^.*State\/Province:[ \t]*/, "", $0)
    print "Admin State/Province", $0
}
section=="Admin" && /Postal Code:/ {
    sub(/^.*Postal Code:[ \t]*/, "", $0)
    print "Admin Postal Code", $0
}
section=="Admin" && /Country:/ {
    sub(/^.*Country:[ \t]*/, "", $0)
    print "Admin Country", $0
}
section=="Admin" && /Phone:/ && !/Ext/ {
    sub(/^.*Phone:[ \t]*/, "", $0)
    print "Admin Phone", $0
}
section=="Admin" && /Phone Ext:/ {
    print "Admin Phone Ext:", ""
}
section=="Admin" && /Fax:/ && !/Ext/ {
    sub(/^.*Fax:[ \t]*/, "", $0)
    print "Admin Fax", $0
}
section=="Admin" && /Fax Ext:/ {
    print "Admin Fax Ext:", ""
}
section=="Admin" && /Email:/ {
    sub(/^.*Email:[ \t]*/, "", $0)
    print "Admin Email", $0
}

# Tech
section=="Tech" && /Name:/ {
    sub(/^.*Name:[ \t]*/, "", $0)
    print "Tech Name", $0
}
section=="Tech" && /Organization:/ {
    sub(/^.*Organization:[ \t]*/, "", $0)
    print "Tech Organization", $0
}
section=="Tech" && /Street:/ {
    sub(/^.*Street:[ \t]*/, "", $0)
    print "Tech Street", $0 " "
}
section=="Tech" && /City:/ {
    sub(/^.*City:[ \t]*/, "", $0)
    print "Tech City", $0
}
section=="Tech" && /State\/Province:/ {
    sub(/^.*State\/Province:[ \t]*/, "", $0)
    print "Tech State/Province", $0
}
section=="Tech" && /Postal Code:/ {
    sub(/^.*Postal Code:[ \t]*/, "", $0)
    print "Tech Postal Code", $0
}
section=="Tech" && /Country:/ {
    sub(/^.*Country:[ \t]*/, "", $0)
    print "Tech Country", $0
}
section=="Tech" && /Phone:/ && !/Ext/ {
    sub(/^.*Phone:[ \t]*/, "", $0)
    print "Tech Phone", $0
}
section=="Tech" && /Phone Ext:/ {
    print "Tech Phone Ext:", ""
}
section=="Tech" && /Fax:/ && !/Ext/ {
    sub(/^.*Fax:[ \t]*/, "", $0)
    print "Tech Fax", $0
}
section=="Tech" && /Fax Ext:/ {
    print "Tech Fax Ext:", ""
}
section=="Tech" && /Email:/ {
    sub(/^.*Email:[ \t]*/, "", $0)
    print "Tech Email", $0
}
' > "$outfile"
