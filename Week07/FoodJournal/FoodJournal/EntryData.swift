//
//  EntryData.swift
//  FoodJournal
//
//  Created by Stella Wang on 10/21/25.
//

import Foundation
import SwiftUI

struct EntryData: Codable {
    var items: [EntryItem]
    
    init () {
        items = [];
    }
    
    mutating func addItem(item: EntryItem) {
        items.append(item)
    }
    
    mutating func updateItem(item: EntryItem) {
        if let index = findIndex(item.id) {
            items[index] = item;
        }
    }
    
    mutating func deleteItem(id: UUID) {
        if let index = findIndex(id) {
            items.remove(at: index)
        }
    }
    
    func findIndex(_ id: UUID) -> Int? {
        return items.firstIndex { item in item.id == id }
    }
    
}
