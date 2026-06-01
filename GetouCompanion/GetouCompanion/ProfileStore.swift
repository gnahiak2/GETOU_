import Foundation

final class ProfileStore {

    private let fileName = "profiles.json"

    private var url: URL {
        let fm = FileManager.default
        let base = fm.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        let dir = base.appendingPathComponent("GetouCompanion", isDirectory: true)

        try? fm.createDirectory(at: dir, withIntermediateDirectories: true)

        return dir.appendingPathComponent(fileName)
    }

    func loadProfiles() throws -> [MacroProfile] {
        guard FileManager.default.fileExists(atPath: url.path) else {
            return []
        }

        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([MacroProfile].self, from: data)
    }

    func saveProfiles(_ profiles: [MacroProfile]) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]

        let temp = url.appendingPathExtension("tmp")

        let data = try encoder.encode(profiles)
        try data.write(to: temp, options: .atomic)

        _ = try FileManager.default.replaceItemAt(url, withItemAt: temp)
    }
}