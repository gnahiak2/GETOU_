//
//  ProfileStore.swift
//  GetouCompanion
//

import Foundation

final class ProfileStore {
    private let fileName = "profiles.json"

    private var appSupportDir: URL {
        let fm = FileManager.default
        let base = fm.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
        let dir = base.appendingPathComponent("GetouCompanion", isDirectory: true)
        if !fm.fileExists(atPath: dir.path) {
            try? fm.createDirectory(at: dir, withIntermediateDirectories: true)
        }
        return dir
    }

    private var fileURL: URL {
        appSupportDir.appendingPathComponent(fileName)
    }

    func loadProfiles() throws -> [MacroProfile] {
        let url = fileURL
        guard FileManager.default.fileExists(atPath: url.path) else {
            throw CocoaError(.fileNoSuchFile)
        }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([MacroProfile].self, from: data)
    }

    func saveProfiles(_ profiles: [MacroProfile]) throws {
        let data = try JSONEncoder().encode(profiles)
        try data.write(to: fileURL, options: [.atomic])
    }
}
