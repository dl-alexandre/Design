//
//  SearchButtonStyle.swift
//  Design
//  https://github.com/dl-alexandre/Design
//  See LICENSE for license information.
//

import SwiftUI

public struct SearchButtonStyle: ButtonStyle {
    public var color: Color
    public func makeBody(configuration: Configuration) -> some View {
        GrayRectangle(maxWidth: 40)
            .overlay {
                configuration.label
                    .font(.headline)
                    .foregroundColor(configuration.isPressed ? .gray.opacity(0.7) : color.opacity(0.8))
                    .shadow(color: configuration.isPressed ? .gray : color, radius: 0.5, x: 1, y: 1)
            }
    }
}
