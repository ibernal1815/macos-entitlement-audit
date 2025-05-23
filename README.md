# macOS Entitlement Audit

This project is a security-oriented macOS entitlement auditing toolkit designed to extract, analyze, and identify potentially dangerous entitlements in macOS application binaries. It reflects a practical understanding of macOS code signing, binary analysis, and privilege boundaries within the Apple ecosystem.

---

## 📁 Project Structure
macos-entitlement-audit/
├── data/            # Extracted entitlement files (.plist)
├── docs/            # Entitlement documentation and threat analysis
├── scripts/         # Bash automation scripts
├── screenshots/     # Screenshots demonstrating tool usage and output
└── README.md        # Main project documentation

---

## 🎯 Objectives

- Automate extraction of application entitlements using `codesign`
- Identify insecure or debugging-related entitlements (`get-task-allow`, `disable-library-validation`, etc.)
- Showcase security tooling logic through lightweight scripting
- Document potential risks associated with misconfigured entitlements

---

## ⚙️ Requirements

> This project is meant for demonstration and must be run in a **macOS environment**.

- macOS 12+ (tested on Sonoma in a VM)
- Command-line tools:
  - `codesign`
  - `bash`
  - `grep`

---

## 🚀 How It Works

1. **Input Preparation**:
   - List target application paths in a `targets.txt` file.

2. **Extraction** (`scripts/extract_entitlements.sh`):
   - Uses `codesign` to extract entitlements and save them to `data/` as `.plist` files.

3. **Analysis** (`scripts/scan_suspicious.sh`):
   - Searches for high-risk entitlements using `grep` pattern matching.

4. **Documentation** (`docs/`):
   - Contains explanations of entitlement types and associated risks.

---

## 🛡️ Key Entitlements Flagged

- `com.apple.security.get-task-allow`
- `com.apple.security.cs.disable-library-validation`
- `com.apple.security.cs.allow-dyld-environment-variables`

These may allow debugging, dynamic code injection, or bypassing library validation.

---

## 📚 Learning Outcomes

- Hands-on familiarity with macOS application security
- Entitlement auditing and security configuration analysis
- Practical scripting for static security assessments

---

## 📝 Disclaimer

This repository is for **educational and professional demonstration purposes only**. Do not scan or extract entitlements from systems or binaries you do not own or have permission to analyze.

---

## 🧠 Author Notes

This project was developed as part of my personal cybersecurity lab work and is intended to demonstrate real-world security auditing skills. It is optimized for readability and structured for practical use in red team or audit settings.

