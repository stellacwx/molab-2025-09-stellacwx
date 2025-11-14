//
//  FoodJournalApp.swift
//  FoodJournal
//
//  Created by Stella Wang on 10/20/25.
//

import SwiftUI

@main
struct FoodJournalApp: App {
    @State var document = Document()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(document)
        }
    }
}
