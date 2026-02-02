#!/bin/bash
# Hash a given password using SHA-1 and store in 0_hash.txt

echo -n "$1" | sha1sum | awk '{print $1}' > 0_hash.txt
