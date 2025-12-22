#!/bin/bash

# Check if the script is being run as root/sudo
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root or with sudo." 
   exit 1
fi

# Use the 'last' command to fetch the 5 most recent sessions
# -n 5 limits the output to 5 lines
# -F ensures full date and time format is displayed
last -n 5 -F
