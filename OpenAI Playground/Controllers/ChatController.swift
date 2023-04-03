//
//  ChatController.swift
//  OpenAI Playground
//
//  Created by Brennan Holzer on 3/30/23.
//

import SwiftUI
import Combine

class ChatController: ObservableObject {
    @Published var chat: Chat = Chat()
    @Published var draftMessage: String = ""
    var chatOptions = TextModeOptionsStore(mode: "chat")
    var settingsStore = SettingsStore()
    lazy var apiClient: OpenAIAPIClient = {
        OpenAIAPIClient(openaiApiKey: settingsStore.openaiApiKey)
    }()
    
    func submitDraftMessage() -> ChatMessage {
        let messageObject = chat.addMessage(message: draftMessage, as: .user)
        draftMessage = ""
        return messageObject
    }
}
