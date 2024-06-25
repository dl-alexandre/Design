//
//  AboutView.swift
//  Design
//  https://github.com/dl-alexandre/Design
//  See LICENSE for license information.
//

import SwiftUI

#if os(macOS)
public struct AboutView: View {
    public var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("\(NSApplication.appName ?? "1")")
                Text("Build: \(NSApplication.buildVersion ?? "1")")
                Text("Version: \(NSApplication.appVersion ?? "1")")
                Spacer()
            }
            Spacer()
        }
        .frame(minWidth: 100, minHeight: 300)
    }
}

#Preview {
    AboutView()
}
#endif
