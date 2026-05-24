//
//  Models.swift
//  GetouCompanion
//

import Foundation

struct KeyboardDevice: Identifiable, Hashable {
    let id: UUID
    var vid: UInt16
    var pid: UInt16
    var product: String?
    var manufacturer: String?

    var displayName: String {
        let p = product?.trimmingCharacters(in: .whitespacesAndNewlines)
        if let p, !p.isEmpty { return p }
        return String(format: "USB HID %04X:%04X", vid, pid)
    }
}

struct MacroProfile: Identifiable, Codable, Hashable {
    var id: UUID
    var name: String
    var macros: [MacroDefinition]

    static var example: MacroProfile {
        .init(
            id: UUID(),
            name: "Default",
            macros: [
                .init(id: UUID(), name: "Hello", steps: [.text("hello world")]),
                .init(id: UUID(), name: "Paste", steps: [.hotkey([.command], key: "v")])
            ]
        )
    }
}

struct MacroDefinition: Identifiable, Codable, Hashable {
    var id: UUID
    var name: String
    var steps: [MacroStep]
}

enum ModifierKey: String, Codable, Hashable {
    case command, option, control, shift
}

enum MacroStep: Codable, Hashable {
    case text(String)
    case hotkey([ModifierKey], key: String)

    var debugDescription: String {
        switch self {
        case .text(let s): return "text(\(s))"
        case .hotkey(let mods, let key):
            return "hotkey(\(mods.map { $0.rawValue }.joined(separator: "+")) + \(key))"
        }
    }
}
