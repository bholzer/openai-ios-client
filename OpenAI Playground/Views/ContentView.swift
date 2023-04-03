//
//  ContentView.swift
//  OpenAI Playground
//
//  Created by Brennan Holzer on 3/28/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @StateObject var textOptionsStore = TextModeOptionsStore(mode: "default")
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ImageModeView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Image")
                }
                .tag(0)
            
            TextModeView()
                .tabItem {
                    Image(systemName: "text.bubble")
                    Text("Text")
                }
                .tag(1)
                .environmentObject(textOptionsStore)
            
            AudioModeView()
                .tabItem {
                    Image(systemName: "waveform")
                    Text("Audio")
                }
                .tag(2)
            
            UserSettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
                .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .light) // Preview in light mode

            ContentView()
                .environment(\.colorScheme, .dark) // Preview in dark mode
        }
        ContentView()
    }
}
