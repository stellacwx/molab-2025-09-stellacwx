//
//  PantryItem.swift
//  Pantry
//
//  Created by Stella Wang on 10/16/25.
//
import Foundation

struct PantryItem : Identifiable, Codable {
    var id = UUID()
    var itemName: String = ""
    var itemIcon: String = ""
    var itemAmountText: String = "0"
    var itemAmount: Int { Int(itemAmountText) ?? 0 }
}
