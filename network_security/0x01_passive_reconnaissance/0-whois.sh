whois "$domain" | awk '
BEGIN {
    section = ""
}
...
'
