//
//  AddIndex.swift
//  Design
//  https://github.com/dl-alexandre/Design
//  See LICENSE for license information.
//

import CoreSpotlight
import SwiftUI

public func addIndex(_ domainID: String, _ items: Set<String>) {
    let secureIndex = CSSearchableIndex(name: domainID, protectionClass: .complete)

    let searchableItems = items.map { item in
        let attributeSet = CSSearchableItemAttributeSet(contentType: UTType.text)
        attributeSet.title = item
        return CSSearchableItem(uniqueIdentifier: item, domainIdentifier: domainID, attributeSet: attributeSet)
    }

    secureIndex.indexSearchableItems(searchableItems) { error in
        if let error = error {
            print("Error indexing items: \(error.localizedDescription)")
        } else {
            print(Text("^[\(items.count) items](inflect: true) indexed successfully."))
        }
    }
}
