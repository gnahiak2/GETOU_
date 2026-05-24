//
//  MacroRunner.swift
//  GetouCompanion
//

import Foundation
import ApplicationServices

final class MacroRunner {
    // NOTE: For actual key injection on macOS, the user must grant Accessibility permission.

    func run(macro: MacroDefinition) {
        for step in macro.steps {
            switch step {
            case .text(let s):
                typeText(s)
            case .hotkey(let mods, let key):
                sendHotkey(mods: mods, key: key)
            }
        }
    }

    private func typeText(_ text: String) {
        for scalar in text.unicodeScalars {
            if let event = CGEvent(keyboardEventSource: nil, virtualKey: 0, keyDown: true) {
                event.keyboardSetUnicodeString(stringLength: 1, unicodeString: [UniChar(scalar.value)])
                event.post(tap: .cghidEventTap)
            }
        }
    }

    private func sendHotkey(mods: [ModifierKey], key: String) {
        // TODO: Map key string to virtual key codes robustly.
        // For now, only support single ASCII letter keys.
        guard let first = key.lowercased().unicodeScalars.first else { return }
        let vk = keycodeForLetter(first)

        let flags = cgFlags(for: mods)

        let down = CGEvent(keyboardEventSource: nil, virtualKey: vk, keyDown: true)
        down?.flags = flags
        down?.post(tap: .cghidEventTap)

        let up = CGEvent(keyboardEventSource: nil, virtualKey: vk, keyDown: false)
        up?.flags = flags
        up?.post(tap: .cghidEventTap)
    }

    private func cgFlags(for mods: [ModifierKey]) -> CGEventFlags {
        var f: CGEventFlags = []
        for m in mods {
            switch m {
            case .command: f.insert(.maskCommand)
            case .option: f.insert(.maskAlternate)
            case .control: f.insert(.maskControl)
            case .shift: f.insert(.maskShift)
            }
        }
        return f
    }

    private func keycodeForLetter(_ scalar: UnicodeScalar) -> CGKeyCode {
        // US ANSI layout mapping for a-z.
        switch scalar.value {
        case 97: return 0  // a
        case 98: return 11 // b
        case 99: return 8  // c
        case 100: return 2 // d
        case 101: return 14 // e
        case 102: return 3 // f
        case 103: return 5 // g
        case 104: return 4 // h
        case 105: return 34 // i
        case 106: return 38 // j
        case 107: return 40 // k
        case 108: return 37 // l
        case 109: return 46 // m
        case 110: return 45 // n
        case 111: return 31 // o
        case 112: return 35 // p
        case 113: return 12 // q
        case 114: return 15 // r
        case 115: return 1 // s
        case 116: return 17 // t
        case 117: return 32 // u
        case 118: return 9 // v
        case 119: return 13 // w
        case 120: return 7 // x
        case 121: return 16 // y
        case 122: return 6 // z
        default: return 0
        }
    }
}
