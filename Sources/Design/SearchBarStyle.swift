//
//  SearchBarStyle.swift
//  Design
//  https://github.com/dl-alexandre/Design
//  See LICENSE for license information.
//

import SwiftUI

public struct SearchBarStyle: ViewModifier {
    public func body(content: Content) -> some View {
        GrayRectangle(maxWidth: .infinity)
            .overlay {
                content
                    .font(.custom("SFProText-Bold", size: 18))
                    .foregroundColor(.primary)
            }
    }
    
    public init() {}
}
