//
//  RoundedRectangle.swift
//  OpenAI Playground
//
//  Created by Brennan Holzer on 3/29/23.
//

import SwiftUI

struct RoundedRectangleCorners: Shape {
    var corners: UIRectCorner
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedRectangleCorners(corners: corners, radius: radius))
    }
}

