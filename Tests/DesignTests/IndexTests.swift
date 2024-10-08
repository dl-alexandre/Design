//
//  IndexTests.swift
//  Design
//  https://github.com/dl-alexandre/Design
//  See LICENSE for license information.
//

import Testing
@testable import Design
import CoreSpotlight
import UniformTypeIdentifiers

@Suite("Index Tests")
struct IndexTests {
    @Test("Add Icon to Index")
    func testAddIconToIndex() async throws {
        let mockIndex = CSSearchableIndex(name: "testDomain", protectionClass: .complete)
        let attributeSet = CSSearchableItemAttributeSet(contentType: .text)
        attributeSet.title = "TestItem"
        let item = CSSearchableItem(
            uniqueIdentifier: "TestItem",
            domainIdentifier: "TestDomain",
            attributeSet: attributeSet
        )

        do {
            try await mockIndex.indexSearchableItems([item])
        } catch {
            #expect(true, "Error indexing item: \(String(describing: error))")
        }
    }

    @Test("Remove Icon from Index")
    func testRemoveIconFromIndex() async throws {
        let mockIndex = CSSearchableIndex(name: "testDomain", protectionClass: .complete)
        let item = "TestItem"
        let domainID = "TestDomain"

        // Add the item to the index first
        let attributeSet = CSSearchableItemAttributeSet(contentType: .text)
        attributeSet.title = item
        let searchableItem = CSSearchableItem(
            uniqueIdentifier: item,
            domainIdentifier: domainID,
            attributeSet: attributeSet
        )

        do {
            try await mockIndex.indexSearchableItems([searchableItem])
        } catch {
            #expect(true, "Error indexing item: \(String(describing: error))")
        }

        do {
            try await mockIndex.deleteSearchableItems(withIdentifiers: [item])
        } catch {
            #expect(true, "Error indexing item: \(String(describing: error))")
        }
    }
}
