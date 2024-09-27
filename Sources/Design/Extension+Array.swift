//
//  Extension+Array.swift
//  Design
//  https://github.com/dl-alexandre/Design
//  See LICENSE for license information.
//

import Foundation

public extension Array where Element: Codable {
    func jsonString() -> String? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    init?(jsonString: String) {
        guard let data = jsonString.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data) else { return nil }
        self = result
    }
}

