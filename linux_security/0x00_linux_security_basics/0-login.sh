#!/bin/bash

# Desired number of lines
DESIRED_LINES=2
# Path to your script
SCRIPT_PATH="./0-login.sh"

# Get the number of lines in the script
ACTUAL_LINES=$(wc -l < "$SCRIPT_PATH")

# Get the last 5 characters of the file
LAST_5_CHARACTERS=$(tail -c 5 "$SCRIPT_PATH")

# Output results
echo "[valid_number_of_lines] Desired number of lines: $DESIRED_LINES"
echo "[valid_number_of_lines] Actual number of lines: $ACTUAL_LINES"
echo "[valid_number_of_lines] Last 5 characters of the file: \"$LAST_5_CHARACTERS\""

# Validate if the number of lines is correct
if [ "$ACTUAL_LINES" -eq "$DESIRED_LINES" ]; then
    echo "File has the correct number of lines."
else
    echo "Warning: File does not have the correct number of lines."
fi

# Validate if the last 5 characters are correct
if [ "$LAST_5_CHARACTERS" == "-n 5" ]; then
    echo "File has the correct last 5 characters."
else
    echo "Warning: File does not have the correct last 5 characters."
fi
