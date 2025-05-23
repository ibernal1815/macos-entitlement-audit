# Threat Model: macOS Entitlement Misuse

## Objective
This entitlement audit identifies misconfigured or overly permissive app binaries that may expose the system to code injection, debugging abuse, or sandbox escape.

## Attack Scenarios

- A malicious app side-loads unsigned dynamic libraries via `disable-library-validation`
- A production app retains `get-task-allow`, enabling debuggers to attach and extract secrets
- `DYLD_INSERT_LIBRARIES` is abused with `allow-dyld-environment-variables` to hijack execution flow

## Target Audience
- macOS reverse engineers
- Red team operators
- Secure software developers

This audit simulates static inspection of these risk surfaces.
