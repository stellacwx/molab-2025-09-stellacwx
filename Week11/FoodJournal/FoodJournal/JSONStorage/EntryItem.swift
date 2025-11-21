//
//  EntryItem.swift
//  FoodJournal
//
//  Created by Stella Wang on 10/21/25.
//

import Foundation
import SwiftUI
import PhotosUI

struct EntryItem : Identifiable, Codable {
    var id = UUID()
    var itemName: String = ""
    var itemDate: Date = Date()
    var itemPicture: Data = Data()
    var itemEmotion: String = ""
    var itemNotes: String = ""
}
