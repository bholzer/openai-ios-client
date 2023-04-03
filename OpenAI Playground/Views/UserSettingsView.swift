//
//  UserSettingsView.swift
//  OpenAI Playground
//
//  Created by Brennan Holzer on 3/28/23.
//

import SwiftUI

struct UserSettingsView: View {
    @EnvironmentObject var settingsStore: SettingsStore
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Account")) {
                    TextField("API Key", text: $settingsStore.openaiApiKey)
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        print("saved")
                    }
                }
            }
        }
    }
}

struct UserSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingsView()
    }
}
