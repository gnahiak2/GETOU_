import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        NavigationSplitView {

            List(selection: $appState.selectedProfile) {

                Section("Devices") {
                    ForEach(appState.devices) { device in
                        Text(device.displayName)
                    }
                }

                Section("Profiles") {
                    ForEach(appState.profiles) { profile in
                        Text(profile.name)
                            .tag(profile as MacroProfile?)
                    }
                }
            }

        } detail: {

            if let profile = appState.selectedProfile {
                ProfileDetailView(profile: profile)
            } else {
                ContentUnavailableView(
                    "No Profile",
                    systemImage: "tray",
                    description: Text("Create or select a profile.")
                )
            }
        }
        .frame(minWidth: 900, minHeight: 520)
        .toolbar {
            Button("Refresh Devices") {
                Task { await appState.refreshDevices() }
            }
        }
    }
}