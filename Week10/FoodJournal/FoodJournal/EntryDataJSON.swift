//
//  EntryDataJSON.swift
//  FoodJournal
//
//  Created by Stella Wang on 10/21/25.
//

import Foundation
import SwiftUI

extension EntryData {
    
    // use JSON to save data
    func saveAsJSON(fileName: String) {
        do {
            try saveJSON(fileName: fileName, val: self);
        }
        catch {
            fatalError("Model saveAsJSON error \(error)")
        }
    }
    
    init(JSONfileName fileName: String) {
        items = []
        do {
            self = try loadJSON(EntryData.self, fileName: fileName)
        } catch {
            // fatalError("Model init error \(error)")
            print("Model init JSONfileName error \(error)")
        }
    }
}
