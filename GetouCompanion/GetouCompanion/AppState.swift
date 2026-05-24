//
//  AppState.swift
//  GetouCompanion
//

import Foundation

@MainActor
final class AppState: ObservableObject {
    @Published var devices: [KeyboardDevice] = []
    @Published var selectedDevice: KeyboardDevice?

    @Published var profiles: [MacroProfile] = []
    @Published var selectedProfile: MacroProfile?

    let deviceService = DeviceService()
    let profileStore = ProfileStore()
    let macroRunner = MacroRunner()

    init() {
        Task {
            await refreshDevices()
            await loadProfiles()
        }
    }

    func refreshDevices() async {
        // TODO: integrate IOHIDManager polling + notifications.
        devices = deviceService.stubDevices()
        selectedDevice = devices.first
    }

    func loadProfiles() async {
        do {
            profiles = try profileStore.loadProfiles()
            selectedProfile = profiles.first
        } catch {
            // If none exist, create a default.
            let p = MacroProfile.example
            profiles = [p]
            selectedProfile = p
            try? profileStore.saveProfiles(profiles)
        }
    }

    func run(macro: MacroDefinition) {
        macroRunner.run(macro: macro)
    }
}
