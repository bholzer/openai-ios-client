//
//  TextModeView.swift
//  OpenAI Playground
//
//  Created by Brennan Holzer on 3/28/23.
//

import SwiftUI

struct TextMode {
    let title: String
    let destination: AnyView
}

struct TextModeView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: ChatView()) {
                    Text("Chat")
                }
                NavigationLink(destination: CompleteView()) {
                    Text("Complete")
                }
                NavigationLink(destination: InsertView()) {
                    Text("Insert")
                }
                NavigationLink(destination: EditView()) {
                    Text("Edit")
                }
            }
            .navigationTitle("Mode")
        }
    }
}

struct TextModeView_Previews: PreviewProvider {
    static var previews: some View {
        TextModeView()
    }
}
