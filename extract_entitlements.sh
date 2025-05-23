#!/bin/bash

output_dir="../data"
mkdir -p "$output_dir"

while IFS= read -r file; do
	if [ -f "$file" ]; then
		entitlements=$(codesign -d --entitlements :- "$file" 2>/dev/null)
		if [[ $entitlements == *"<plist"* ]]; then
			appname=$(basename "$file")
			echo "[+] Entitlements located in: $file"
			echo "$entitlements" > "$output_dir/$appname.plist"
		else 
			echo "[-] No entitlements in: $file"
		fi 
	else
		echo "[!] File is not found: $file"
	fi
done < ../targets.txt
