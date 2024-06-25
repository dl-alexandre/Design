//
//  KeyboardAdaptive.swift
//  Design
//  https://github.com/dl-alexandre/Design
//  See LICENSE for license information.
//

import SwiftUI

#if os(iOS)
public struct KeyboardAdaptive: ViewModifier {
    @State private var keyboardHeight: CGFloat = 0
    
    public func body(content: Content) -> some View {
        content
            .padding(.top, keyboardHeight)
            .onAppear(perform: subscribeToKeyboardEvents)
            .onDisappear(perform: unsubscribeFromKeyboardEvents)
    }
    
    private func subscribeToKeyboardEvents() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
            if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                keyboardHeight = keyboardFrame.height
            }
        }
    }
    
    private func unsubscribeFromKeyboardEvents() {
        NotificationCenter.default.removeObserver(self)
    }
}
#else
public struct KeyboardAdaptive: ViewModifier {
    @State private var keyboardHeight: CGFloat = 0
    
    public func body(content: Content) -> some View {
        content
            .padding(.bottom, keyboardHeight)
            .onAppear(perform: subscribeToKeyboardEvents)
            .onDisappear(perform: unsubscribeFromKeyboardEvents)
    }
    
    private func subscribeToKeyboardEvents() {
        NotificationCenter.default.addObserver(forName: NSWindow.didResizeNotification, object: nil, queue: .main) { _ in
            if let keyWindow = NSApp.keyWindow {
                let keyboardFrame = keyWindow.convertFromScreen(keyWindow.frame)
                keyboardHeight = keyWindow.frame.height - keyboardFrame.height
            }
        }
    }
    
    private func unsubscribeFromKeyboardEvents() {
        NotificationCenter.default.removeObserver(self)
    }
}
#endif
