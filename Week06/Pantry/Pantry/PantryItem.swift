//
//  PantryItem.swift
//  Pantry
//
//  Created by Stella Wang on 10/16/25.
//
import Foundation

struct PantryItem : Identifiable, Codable {
    var id = UUID()
    /*
    var urlStr:String = ""
    var label:String = ""
    var assetName:String = ""
    var systemName:String = ""
     */
    
    var itemName: String = ""
    var itemIcon: String = ""
    var itemAmountText: String = "0"
    var itemAmount: Int { Int(itemAmountText) ?? 0 }
}
