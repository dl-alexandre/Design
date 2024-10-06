//
//  KeyboardAdaptive.swift
//  Design
//  https://github.com/dl-alexandre/Design
//  See LICENSE for license information.
//

import SwiftUI

public extension View {
    #if os(macOS)
    func asNSImage() -> NSImage? {
        let hostingView = NSHostingView(rootView: self)
        hostingView.setFrameSize(hostingView.fittingSize)
        guard let bitmapRep = hostingView.bitmapImageRepForCachingDisplay(in: hostingView.bounds) else { return nil }
        hostingView.cacheDisplay(in: hostingView.bounds, to: bitmapRep)
        let image = NSImage(size: hostingView.bounds.size)
        image.addRepresentation(bitmapRep)
        return image
    }
    #endif
}

