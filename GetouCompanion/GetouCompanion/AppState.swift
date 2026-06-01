import Foundation

@MainActor
final class AppState: ObservableObject {

    @Published var devices: [KeyboardDevice] = []
    @Published var selectedDevice: KeyboardDevice?

    @Published var profiles: [MacroProfile] = []
    @Published var selectedProfile: MacroProfile?

    @Published var activeKey: Int?   // for UI feedback

    let deviceService = DeviceService()
    let profileStore = ProfileStore()
    let macroRunner = MacroRunner()
    let inputService = InputService()

    init() {
        setupInput()
        Task {
            await refreshDevices()
            await loadProfiles()
        }
    }

    private func setupInput() {
        inputService.onKeyPress = { [weak self] key in
            guard let self,
                  let profile = self.selectedProfile,
                  let macroID = profile.bindings[key],
                  let macro = profile.macros.first(where: { $0.id == macroID })
            else { return }

            self.activeKey = key
            self.macroRunner.run(macro)
        }
    }

    func refreshDevices() async {
        devices = deviceService.stubDevices()
        selectedDevice = devices.first
    }

    func loadProfiles() async {
        do {
            profiles = try profileStore.loadProfiles()
            if profiles.isEmpty {
                let p = MacroProfile.example
                profiles = [p]
                try? profileStore.saveProfiles(profiles)
            }
            selectedProfile = profiles.first
        } catch {
            let p = MacroProfile.example
            profiles = [p]
            selectedProfile = p
        }
    }
}