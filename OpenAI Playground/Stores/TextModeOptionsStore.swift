//
//  TextModeOptionsStore.swift
//  OpenAI Playground
//
//  Created by Brennan Holzer on 3/29/23.
//

import Combine
import SwiftUI

class TextModeOptionsStore: ObservableObject {
    let mode: String
    @Published var model: String {
        didSet { UserDefaults.standard.set(model, forKey: "model-\(mode)") }
    }
    
    @Published var temperature: Double {
        didSet { UserDefaults.standard.set(temperature, forKey: "temperature-\(mode)") }
    }
    
    @Published var maxLength: Int {
        didSet { UserDefaults.standard.set(maxLength, forKey: "maxLength-\(mode)") }
    }
    
    @Published var topP: Double {
        didSet { UserDefaults.standard.set(topP, forKey: "topP-\(mode)") }
    }
    
    @Published var frequencyPenalty: Double {
        didSet { UserDefaults.standard.set(frequencyPenalty, forKey: "frequencyPenalty-\(mode)") }
    }
    
    @Published var presencePenalty: Double {
        didSet { UserDefaults.standard.set(presencePenalty, forKey: "presencePenalty-\(mode)") }
    }

    init(mode: String) {
        self.mode = mode
        self.model = UserDefaults.standard.string(forKey: "model-\(mode)") ?? "gpt-3.5-turbo"
        self.temperature = UserDefaults.standard.double(forKey: "temperature-\(mode)")
        self.maxLength = UserDefaults.standard.integer(forKey: "maxLength-\(mode)")
        self.topP = UserDefaults.standard.double(forKey: "topP-\(mode)")
        self.frequencyPenalty = UserDefaults.standard.double(forKey: "frequencyPenalty-\(mode)")
        self.presencePenalty = UserDefaults.standard.double(forKey: "presencePenalty-\(mode)")
    }
}

