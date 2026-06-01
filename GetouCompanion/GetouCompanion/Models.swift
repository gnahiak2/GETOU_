import Foundation
import CoreGraphics

// MARK: - Device

struct KeyboardDevice: Identifiable, Hashable {
    let id: UUID
    var vid: UInt16
    var pid: UInt16
    var product: String?
    var manufacturer: String?

    var displayName: String {
        product?.trimmingCharacters(in: .whitespacesAndNewlines).flatMap {
            $0.isEmpty ? nil : $0
        } ?? String(format: "USB HID %04X:%04X", vid, pid)
    }
}

// MARK: - Hotkey System

struct Hotkey: Codable, Hashable {
    var keyCode: CGKeyCode
    var modifiers: [ModifierKey]
}

enum ModifierKey: String, Codable, Hashable {
    case command, option, control, shift
}

// MARK: - Macro Actions

enum MacroAction: Codable, Hashable {
    case text(String)
    case hotkey(Hotkey)
    case delay(Double)
    case openApp(String)
    case runShell(String)
}

// MARK: - Macro

struct MacroDefinition: Identifiable, Codable, Hashable {
    var id: UUID
    var name: String
    var actions: [MacroAction]
}

// MARK: - Profile

struct MacroProfile: Identifiable, Codable, Hashable {
    var id: UUID
    var name: String

    /// keyIndex (F13=0...) → macroID
    var bindings: [Int: UUID]

    var macros: [MacroDefinition]

    static var example: MacroProfile {
        let macro = MacroDefinition(
            id: UUID(),
            name: "Hello",
            actions: [.text("hello world")]
        )

        return MacroProfile(
            id: UUID(),
            name: "Default",
            bindings: [0: macro.id],
            macros: [macro]
        )
    }
}