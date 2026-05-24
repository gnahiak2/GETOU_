//
//  GetouCompanionApp.swift
//  GetouCompanion
//

import SwiftUI

@main
struct GetouCompanionApp: App {
    @StateObject private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
