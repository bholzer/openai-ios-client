//
//  OpenAI_PlaygroundApp.swift
//  OpenAI Playground
//
//  Created by Brennan Holzer on 3/28/23.
//

import SwiftUI

@main
struct OpenAI_PlaygroundApp: App {
    @StateObject var settingsStore = SettingsStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settingsStore)
        }
    }
}
