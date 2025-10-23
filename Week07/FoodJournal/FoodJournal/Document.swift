
//
//  Model.swift
//

import Foundation

@Observable
class Document {
    var model: EntryData
    
    // file name to store JSON for model items
    let saveFileName = "entries.json"
    
    // true to initialize model items with sample items
    let initSampleItems = true
    
    init() {
        print("Model init")
        
        // For testing:
        // remove(fileName: saveFileName)
        
        model = EntryData(JSONfileName: saveFileName);
        if initSampleItems && model.items.isEmpty {
            // items for testing
            model.items = []
            saveModel();
        }
    }
    
    func addItem(itemName: String, itemDate: Date, itemPicture: Data, itemEmotion: String, itemNotes: String) {
        let item = EntryItem(id: UUID(), itemName: itemName, itemDate: itemDate, itemPicture: itemPicture, itemEmotion: itemEmotion, itemNotes: itemNotes);
        model.addItem(item: item);
    }
    
    func addItem(item: EntryItem) {
        model.addItem(item: item);
        saveModel();
    }

    func updateItem(item: EntryItem) {
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

