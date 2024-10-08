//
//  Notification+Copy.swift
//  Design
//  https://github.com/dl-alexandre/Design
//  See LICENSE for license information.
//

import SwiftUI

@ViewBuilder
public func copyNotification(isCopied: Binding<Bool>, icon: Binding<String>) -> some View {
    if isCopied.wrappedValue {
        Text("Copied")
            .font(.title)
            .bold()
            .foregroundColor(.green)
            .transition(.move(edge: .top))
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.easeOut(duration: 0.4)) {
                        isCopied.wrappedValue = false
                        icon.wrappedValue = ""
                    }
                }
            }
    }
}
