//
//  CompleteView.swift
//  OpenAI Playground
//
//  Created by Brennan Holzer on 3/28/23.
//

import SwiftUI

struct CompleteView: View {
    @State private var inputSentence: String = ""
    @State private var resultSentence: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Spacer()
            HStack {
                TextEditorDynamic(text: $inputSentence)
                    .multilineTextAlignment(.leading)
                    .focused($isFocused)
                
                Button(action: {
                    // Call GPT-3 API handle insert
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
        .padding()
        .navigationTitle("Complete")
    }
}

struct CompleteView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteView()
    }
}

