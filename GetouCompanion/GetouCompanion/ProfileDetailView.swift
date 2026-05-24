//
//  ProfileDetailView.swift
//  GetouCompanion
//

import SwiftUI

struct ProfileDetailView: View {
    @EnvironmentObject private var appState: AppState

    @State var profile: MacroProfile

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(profile.name)
                    .font(.title2)
                Spacer()
                if let device = appState.selectedDevice {
                    Text("Device: \(device.displayName)")
                        .foregroundStyle(.secondary)
                } else {
                    Text("No device selected")
                        .foregroundStyle(.secondary)
                }
            }

            Divider()

            List {
                Section("Macros") {
                    ForEach(profile.macros) { m in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(m.name)
                                Text(m.steps.map { $0.debugDescription }.joined(separator: ", "))
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                    .lineLimit(1)
                            }
                            Spacer()
                            Button("Run") {
                                appState.run(macro: m)
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}
