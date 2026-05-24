# Getou Companion (macOS)

macOS-native companion app for the **getou_** QMK macropad.

## Goals
- **Configure macros on-device** (when supported by firmware/protocol)
- **Host-side macros** on macOS (local profiles + macro runner)
- Clean SwiftUI UI + native device enumeration

## Status
Scaffold (SwiftUI project skeleton + core models/services).

## Development
Open `GetouCompanion/GetouCompanion.xcodeproj` in Xcode.

## Roadmap (MVP)
- [ ] Detect HID devices and identify candidate QMK devices (VID/PID heuristics + user selection)
- [ ] Macro editor (name + steps)
- [ ] Local profiles (JSON) stored in Application Support
- [ ] Host-side macro runner (CGEvent-based key injection)
- [ ] Optional: RawHID protocol to/from QMK firmware for syncing
