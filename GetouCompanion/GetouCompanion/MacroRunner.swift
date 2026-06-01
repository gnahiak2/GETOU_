import Foundation
import ApplicationServices
import AppKit

final class MacroRunner {

    func run(_ macro: MacroDefinition) {
        for action in macro.actions {
            switch action {

            case .text(let text):
                typeText(text)

            case .hotkey(let hotkey):
                sendHotkey(hotkey)

            case .delay(let seconds):
                Thread.sleep(forTimeInterval: seconds)

            case .openApp(let app):
                NSWorkspace.shared.launchApplication(app)

            case .runShell(let cmd):
                runShell(cmd)
            }
        }
    }

    private func typeText(_ text: String) {
        let source = CGEventSource(stateID: .combinedSessionState)

        for scalar in text.unicodeScalars {
            var uni = UniChar(scalar.value)

            let event = CGEvent(
                keyboardEventSource: source,
                virtualKey: 0,
                keyDown: true
            )

            event?.keyboardSetUnicodeString(
                stringLength: 1,
                unicodeString: &uni
            )

            event?.post(tap: .cghidEventTap)
        }
    }

    private func sendHotkey(_ hotkey: Hotkey) {
        let flags = cgFlags(hotkey.modifiers)

        let down = CGEvent(
            keyboardEventSource: nil,
            virtualKey: hotkey.keyCode,
            keyDown: true
        )

        down?.flags = flags
        down?.post(tap: .cghidEventTap)

        let up = CGEvent(
            keyboardEventSource: nil,
            virtualKey: hotkey.keyCode,
            keyDown: false
        )

        up?.flags = flags
        up?.post(tap: .cghidEventTap)
    }

    private func cgFlags(_ mods: [ModifierKey]) -> CGEventFlags {
        var flags: CGEventFlags = []

        for m in mods {
            switch m {
            case .command: flags.insert(.maskCommand)
            case .option: flags.insert(.maskAlternate)
            case .control: flags.insert(.maskControl)
            case .shift: flags.insert(.maskShift)
            }
        }

        return flags
    }

    private func runShell(_ cmd: String) {
        let task = Process()
        task.launchPath = "/bin/bash"
        task.arguments = ["-c", cmd]
        try? task.run()
    }
}