
//
//  Model.swift
//

import Foundation

@Observable
class Document {
    var model: PantryData
    
    // file name to store JSON for model items
    let saveFileName = "pantryData.json"
    
    // true to initialize model items with sample items
    let initSampleItems = true
    
    init() {
        print("Model init")
        
        // For testing:
        // remove(fileName: saveFileName)
        
        model = PantryData(JSONfileName: saveFileName);
        if initSampleItems && model.items.isEmpty {
            // items for testing
            model.items = []
            saveModel();
        }
    }
    
    func addItem(itemName: String, itemIcon: String, itemAmountText: String) {
        let item = PantryItem(id: UUID(), itemName: itemName, itemIcon: itemIcon, itemAmountText: itemAmountText);
        model.addItem(item: item);
    }
    
    func addItem(item: PantryItem) {
        model.addItem(item: item);
        saveModel();
    }

    func updateItem(item: PantryItem) {
        model.updateItem(item: item);
        saveModel();
    }
    
    func deleteItem(id: UUID) {
        model.deleteItem(id: id)
        saveModel();
    }
    
    func saveModel() {
        print("Document saveModel")
        model.saveAsJSON(fileName: saveFileName)
    }
}

