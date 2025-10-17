//
//  PantryDataJSON.swift
//  Pantry
//
//  Created by Stella Wang on 10/17/25.
//

import Foundation
import SwiftUI

extension PantryData {
    
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
            self = try loadJSON(PantryData.self, fileName: fileName)
        } catch {
            // fatalError("Model init error \(error)")
            print("Model init JSONfileName error \(error)")
        }
    }
}
