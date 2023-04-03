//
//  TextModeListView.swift
//  OpenAI Playground
//
//  Created by Brennan Holzer on 3/28/23.
//

import SwiftUI

struct TextModeListView: View {
    let options = [
        "Chat",
        "Complete",
        "Insert",
        "Edit"
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(options, id: \.self) { item in
                    Text(item)
//                        .listRowSeparator(.hidden, edges: .bottom)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Mode")
        }
        
    }
}

struct TextModeListView_Previews: PreviewProvider {
    static var previews: some View {
        TextModeListView()
    }
}
