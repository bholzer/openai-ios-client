//
//  ImageModeView.swift
//  OpenAI Playground
//
//  Created by Brennan Holzer on 3/28/23.
//

import SwiftUI

struct ImageModeView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(.label))
                .font(.largeTitle)
        }
    }
}

struct ImageModeView_Previews: PreviewProvider {
    static var previews: some View {
        ImageModeView()
    }
}
