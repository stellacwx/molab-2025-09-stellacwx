//
//  PantryData.swift
//  Pantry
//
//
//

import Foundation
import SwiftUI

struct PantryData: Codable {
    var items: [PantryItem]
    
    init () {
        items = [];
    }
    
    mutating func addItem(item: PantryItem) {
        items.append(item)
    }
    
    mutating func updateItem(item: PantryItem) {
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
