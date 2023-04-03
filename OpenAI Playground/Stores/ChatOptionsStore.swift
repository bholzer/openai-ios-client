//
//  ChapOptionsStore.swift
//  OpenAI Playground
//
//  Created by Brennan Holzer on 3/29/23.
//

import Combine
import SwiftUI

class ChapOptionsStore: ObservableObject {
    @Published var model: String {
        didSet { UserDefaults.standard.set(model, forKey: "model") }
    }

    init() {
        self.model = UserDefaults.standard.string(forKey: "model") ?? "gpt-3.5-turbo"
    }
}
