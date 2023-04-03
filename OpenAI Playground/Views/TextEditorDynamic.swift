//
//  TextEditorDynamic.swift
//  OpenAI Playground
//
//  Created by Brennan Holzer on 3/29/23.
//

import SwiftUI

struct TextEditorDynamic: View {
    var text: Binding<String>
    
    var body: some View {
            TextEditor(text: text)
                .frame(minHeight: 38, maxHeight: 300)
                .scrollContentBackground(.hidden)
                .padding(2)
                .background(Color.gray.opacity(0.2))
                .dynamicTypeSize(.medium ... .xxLarge)
                .fixedSize(horizontal: false, vertical: true)
                .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary).opacity(0.5))
    }
}

