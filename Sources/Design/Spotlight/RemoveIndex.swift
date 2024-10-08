//
//  RemoveIndex.swift
//  Design
//  https://github.com/dl-alexandre/Design
//  See LICENSE for license information.
//

import CoreSpotlight

public func removeIndex(_ item: String, _ domainID: String) {
    let secureIndex = CSSearchableIndex(name: domainID, protectionClass: .complete)

    secureIndex.deleteSearchableItems(withIdentifiers: [item]) { error in
        if let error = error {
            print("Error indexing item: \(error.localizedDescription)")
        } else {
            print("\(item) indexed successfully.")
        }
    }
}
