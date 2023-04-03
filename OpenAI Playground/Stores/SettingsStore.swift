//
//  SettingsStore.swift
//  OpenAI Playground
//
//  Created by Brennan Holzer on 3/29/23.
//

import Foundation

import Combine
import SwiftUI

class SettingsStore: ObservableObject {
    @Published var openaiApiKey: String {
        didSet { UserDefaults.standard.set(openaiApiKey, forKey: "openaiApiKey") }
    }

    init() {
        self.openaiApiKey = UserDefaults.standard.string(forKey: "openaiApiKey") ?? ""
    }
}
