//
//  ChatView.swift
//  OpenAI Playground
//
//  Created by Brennan Holzer on 3/28/23.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatController = ChatController()
    @State private var currentScrollOffset: CGFloat = 0
    @State private var contentHeight: CGFloat = 0
    @State private var scrollViewHeight: CGFloat = 0
    @FocusState private var isFocused: Bool

    private func scrollToLatestMessage(using scrollProxy: ScrollViewProxy) {
        if let lastMessage = chatController.chat.messages.last {
            let bottomTolerance: CGFloat = 60
            
            let offset = currentScrollOffset - (scrollViewHeight - contentHeight)
            
            let userIsAtBottom = offset <= bottomTolerance

            if userIsAtBottom {
                withAnimation {
                    scrollProxy.scrollTo(lastMessage.id, anchor: .bottom)
                }
            }
        }
    }

    var body: some View {
        VStack {
            ScrollView {
                ScrollViewReader { scrollProxy in
                    LazyVStack(spacing: 8) {
                        VStack {
                            ForEach(chatController.chat.messages) { chatMessage in
                                ChatBubble(chatMessage: chatMessage)
                                    .contextMenu {
                                        Button(action: {
                                            // Do edit
                                        }) {
                                            Text("Edit")
                                            Image(systemName: "pencil")
                                        }
                                        Button(action: {
                                            chatController.chat.deleteMessage(message: chatMessage)
                                        }) {
                                            Text("Delete")
                                            Image(systemName: "trash")
                                        }
                                    }
                            }
                        }
                    }
                    .padding(.bottom, 10.0)
                    .background(GeometryReader { geometry -> Color in
                        let minY = geometry.frame(in: .named("scroll")).minY
                        DispatchQueue.main.async {
                            currentScrollOffset = minY
                            contentHeight = geometry.size.height
                        }
                        return Color.clear
                    })
                }
            }
            .background(GeometryReader { geometry -> Color in
                DispatchQueue.main.async {
                    scrollViewHeight = geometry.size.height
                }
                return Color.clear
            })
            .coordinateSpace(name: "scroll")

                
            HStack {
                TextEditorDynamic(text: $chatController.draftMessage)
                    .multilineTextAlignment(.leading)
                    .focused($isFocused)
                
                Button(action: {
                    let _: ChatMessage = chatController.submitDraftMessage()
                }) {
                    Image(systemName: "paperplane")
                        .font(.system(size: 22))
                        .foregroundColor(.primary)
                        .padding(.trailing)
                        .frame(alignment: .bottom)
                }
            }
            .padding()
           
        }
        .navigationTitle("Chat")
        .padding(.bottom, 8)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

