#!/bin/bash
# This script scans extracted entitlement .plist files for dangerous or suspicious entitlements

# Change to the data directory containing the .plist entitlement files
cd ../data

# Initialize a variable to track whether any suspicious entitlements are found
found=0

# Loop through each .plist file in the data directory
for file in *.plist; do
    # Search for any of the three suspicious entitlements in the current file
    if fgrep -q -e "get-task-allow" -e "disable-library-validation" -e "allow-dyld-environment-variables" "$file"; then
        # If found, print a warning and show the matching lines
        echo "[!] Suspicious entitlement detected in $file:"
        fgrep -e "get-task-allow" -e "disable-library-validation" -e "allow-dyld-environment-variables" "$file"
        echo

        # Set flag indicating a match was found
        found=1
    fi
done

# If no suspicious entitlements were found in any file, print a confirmation message
if [ "$found" -eq 0 ]; then
    echo "[+] There are currently no suspicious entitlements found in any of the applications!"
fi
