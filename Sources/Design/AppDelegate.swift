//
//  AppDelegate.swift
//  Design
//  https://github.com/dl-alexandre/Design
//  See LICENSE for license information.
//

import SwiftUI
#if os(macOS)
import AppKit

public class AppDelegate: NSObject, NSApplicationDelegate {
    private var aboutBoxWindowController: NSWindowController?
    
    @MainActor public func showAboutPanel() {
        if aboutBoxWindowController == nil {
            let styleMask: NSWindow.StyleMask = [.closable, .miniaturizable, .titled]
            let window = NSWindow()
            window.styleMask = styleMask
            window.title = "About \(NSApplication.appName ?? "")"
            window.contentView = NSHostingView(rootView: AboutView())
            aboutBoxWindowController = NSWindowController(window: window)
        }
        aboutBoxWindowController?.showWindow(aboutBoxWindowController?.window)
    }
}
#endif
