#!/bin/bash

cd ../data

found=0

for file in *.plist; do
	if fgrep -q -e "get-task-allow" -e "disable-library-validation" -e "allow-dyld-environment-variables" "$file"; then
		echo "[!] Suspicious entitlement detected in $file:"
		fgrep -e "get-task-allow" -e "disable-library-validation" -e "allow-dyld-environment-variables" "$file"
		echo
		found=1
	fi
done

if [ "$found" -eq 0 ]; then
	echo "[+] There are currently no suspicious entitlements found in any of the applications!"
fi 
