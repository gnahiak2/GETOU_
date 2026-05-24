# Build from VS Code

## Prereqs
- Install Xcode (or at least Xcode Command Line Tools):
  - `xcode-select --install`

## Build
1. Open the repo in VS Code.
2. Run **Terminal → Run Task…**
3. Choose: **GetouCompanion: Build (Debug)**

You can also run from the VS Code terminal:

```sh
xcodebuild \
  -project GetouCompanion/GetouCompanion.xcodeproj \
  -scheme GetouCompanion \
  -configuration Debug \
  -destination "platform=macOS" \
  build