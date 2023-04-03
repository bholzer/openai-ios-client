//
//  ChatBubble.swift
//  OpenAI Playground
//
//  Created by Brennan Holzer on 3/29/23.
//

import SwiftUI

struct ChatBubble: View {
    let chatMessage: ChatMessage

    var body: some View {
        HStack {
            if chatMessage.type == .user {
                Spacer()
            }
            
            Text(chatMessage.message)
                .padding(10)
                .background(chatMessage.type == .user ? Color.blue : Color.gray.opacity(0.5))
                .foregroundColor(chatMessage.type == .user ? .white : .black)
                .cornerRadius(10, corners: chatMessage.type == .user ? [.topLeft, .bottomLeft, .bottomRight] : [.topLeft, .topRight, .bottomRight])
            
            if chatMessage.type == .system {
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(chatMessage: ChatMessage(message: "Hello World", type: .user))
        ChatBubble(chatMessage: ChatMessage(message: "Hello Back!", type: .system))
    }
}
