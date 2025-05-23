# Entitlement Reference: macOS Security Risks

This document explains sensitive macOS entitlements that may introduce security risks if misused or left enabled in production applications.

## 🚨 High-Risk Entitlements

| Entitlement | Description |
|------------|-------------|
| `com.apple.security.get-task-allow` | Allows a debugger to attach to the process. Intended for development; unsafe for production. |
| `com.apple.security.cs.disable-library-validation` | Allows the app to load unsigned or unvalidated dynamic libraries. Useful for plugins, but enables code injection. |
| `com.apple.security.cs.allow-dyld-environment-variables` | Lets attackers manipulate environment variables that affect how libraries load. Often exploited in local privilege escalation. |

Use of these entitlements should be carefully reviewed and limited to development builds or sandboxed environments.
