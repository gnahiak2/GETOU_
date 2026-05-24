# GetouCompanion (macOS)

macOS-native companion app for the **getou_** QMK macropad.

This app is currently a **scaffold**:
- SwiftUI UI (profiles + macros)
- Local profile storage (JSON in Application Support)
- A basic host-side macro runner (CGEvent-based)
- A stub “device service” that pretends a device exists (VID `0xFEED`, PID `0x1234` from `Firmware/keyboard.json`)

> Note: The macro runner uses macOS Accessibility APIs and may require you to grant permissions.

---

## Requirements

- macOS 14+ recommended
- Xcode 15+ recommended (Xcode 14 may work, but the project is set up assuming modern SwiftUI)
- Optional: VS Code (as editor)

---

## Build & Run (Xcode)

1. Open the Xcode project:

   - `GetouCompanion/GetouCompanion.xcodeproj`

2. Select the scheme **GetouCompanion**.
3. Choose **My Mac** as the run destination.
4. Press **Run** (⌘R).

### If macOS blocks macro injection (Accessibility)

The app uses `CGEvent` to generate key events. To allow that:

1. Open **System Settings → Privacy & Security → Accessibility**
2. Enable the app (or enable Xcode if you’re running from Xcode)
3. Re-run the app

If you don’t see it listed, run once, then check again.

---

## Build from Terminal (xcodebuild)

From the repo root:

```sh
cd GetouCompanion
xcodebuild \
  -project GetouCompanion.xcodeproj \
  -scheme GetouCompanion \
  -configuration Debug \
  -destination "platform=macOS" \
  build
```

> Running from terminal is possible but less convenient for signing/permissions/debugging.

---

## Using VS Code

You can use VS Code to **edit** the Swift files. For **build/run/debug**, Xcode is still the simplest route.

Suggested workflow:
- Edit code in VS Code
- When you want to run: open the Xcode project and press ⌘R

Optional extensions:
- Swift language support
- SwiftLint (if you add linting later)

---

## Where data is stored

Profiles are saved to:

`~/Library/Application Support/GetouCompanion/profiles.json`

The app will create a default profile if none exists.

---

## Project structure

- `GetouCompanion/GetouCompanion/` — Swift source
  - `AppState.swift` — global app state (devices + profiles)
  - `Models.swift` — `MacroProfile`, `MacroDefinition`, `MacroStep`, `KeyboardDevice`
  - `ProfileStore.swift` — JSON load/save
  - `MacroRunner.swift` — host-side macro execution (CGEvent)
  - `DeviceService.swift` — device discovery (currently stubbed)
  - `ContentView.swift` / `ProfileDetailView.swift` — SwiftUI UI

---

## Roadmap

- Real HID enumeration (IOHIDManager)
- Macro editor UI (create/edit steps)
- Better keycode mapping (full hotkey support)
- Optional QMK RawHID protocol support for on-device sync
