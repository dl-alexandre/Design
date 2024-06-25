//
//  BundleID.swift
//  Design
//  https://github.com/dl-alexandre/Design
//  See LICENSE for license information.
//

import SwiftUI

public var bundleIDVersion: String? {
    return Bundle.main.object(forInfoDictionaryKey: "ProductBundleIdentifier") as? String
}
