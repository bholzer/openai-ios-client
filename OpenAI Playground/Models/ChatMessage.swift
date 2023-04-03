//
//  ChatMessage.swift
//  OpenAI Playground
//
//  Created by Brennan Holzer on 3/29/23.
//

import Foundation

enum MessageType {
    case system
    case user
    var isUser: Bool {
        switch self {
        case .user:
            return true
        case .system:
            return true
        }
    }
}

struct ChatMessage: Identifiable, Equatable {
    let id = UUID()
    var message: String
    let type: MessageType
    var editHistory: [String] = []
    
    static func ==(lhs: ChatMessage, rhs: ChatMessage) -> Bool {
        return lhs.id == rhs.id
    }
    
    mutating func edit(to newMessage: String) {
        editHistory.append(message)
        message = newMessage
    }
}

