#!/bin/bash
# This script extracts entitlements from macOS application binaries listed in targets.txt

# Define output directory where .plist entitlement files will be saved
output_dir="../data"

# Create the output directory if it doesn't already exist
mkdir -p "$output_dir"

# Read each line (application binary path) from targets.txt
while IFS= read -r file; do
    # Check if the file exists and is a regular file
    if [ -f "$file" ]; then

        # Use codesign to extract entitlements; suppress errors with 2>/dev/null
        entitlements=$(codesign -d --entitlements :- "$file" 2>/dev/null)

        # If the output contains a <plist>, assume entitlements were found
        if [[ $entitlements == *"<plist"* ]]; then
            # Extract the base name of the app binary (e.g., Chrome -> chrome.plist)
            appname=$(basename "$file")

            # Print a success message
            echo "[+] Entitlements located in: $file"

            # Save the entitlements to a .plist file in the output directory
            echo "$entitlements" > "$output_dir/$appname.plist"
        else 
            # If no entitlements were found
            echo "[-] No entitlements in: $file"
        fi 
    else
        # If the binary path listed in targets.txt doesn't exist
        echo "[!] File is not found: $file"
    fi
done < ../targets.txt  # Read file paths from targets.txt in the parent directory
