//
//  Chat.swift
//  OpenAI Playground
//
//  Created by Brennan Holzer on 3/30/23.
//

import Foundation

struct Chat: Identifiable {
    let id = UUID()
    let prompt: String = ""
    var messages: [ChatMessage] = []
    
    func getMessage(id: UUID) -> ChatMessage? {
        return messages.first(where: { $0.id == id })
    }
    
    mutating func deleteMessage(message: ChatMessage) {
        messages.removeAll(where: { $0.id == message.id })
        print(messages)
    }
    
    mutating func deleteMessage(at index: Int) {
        messages.remove(at: index)
    }

    mutating func addMessage(message: ChatMessage) -> ChatMessage {
        messages.append(message)
        return message
    }

    mutating func addMessage(message: String, as type: MessageType) -> ChatMessage {
        let chatMessage = ChatMessage(message: message, type: type)
        messages.append(chatMessage)
        return chatMessage
    }
    
    mutating func editMessage(at index: Int, to newMessage: String) {
        messages[index].edit(to: newMessage)
    }
}

