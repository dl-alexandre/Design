//
//  AddIndex.swift
//  Design
//  https://github.com/dl-alexandre/Design
//  See LICENSE for license information.
//

import CoreSpotlight

public func addIndex(_ domainID: String,_ items: String...) {
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
            print("\(items.count) items indexed successfully.")
        }
    }
}
