# Tooling Notes

This project used macOS-native tools and shell scripting to audit binary entitlements.

## Tools Used

| Tool | Purpose |
|------|---------|
| `codesign` | Extracts embedded entitlements from signed macOS binaries |
| `grep` / `fgrep` | Scans for high-risk entitlement keywords |
| `bash` | Automates the auditing process across multiple applications |

## Script Summary

- `extract_entitlements.sh`: Iterates through apps in `targets.txt`, extracts entitlements, and saves them to `.plist` files.
- `scan_suspicious.sh`: Analyzes `.plist` files for known dangerous entitlements and prints results.

These scripts were run on macOS Sonoma in a VMware Pro VM.
