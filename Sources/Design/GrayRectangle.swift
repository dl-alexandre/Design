//
//  GrayRectangle.swift
//  Design
//  https://github.com/dl-alexandre/Design
//  See LICENSE for license information.
//

import SwiftUI

public struct GrayRectangle: View {
    var maxWidth: CGFloat
    
    public var body: some View {
        Rectangle()
            .fill(.ultraThickMaterial)
            .frame(maxWidth: maxWidth, maxHeight: 40)
            .shadow(color: .white, radius: 1, x: -2, y: -2)
            .shadow(color: .gray, radius: 1, x: 2, y: 2)
            .cornerRadius(2)
    }
}
