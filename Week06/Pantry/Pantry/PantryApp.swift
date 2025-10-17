//
//  PantryApp.swift
//  Pantry
//
//  Created by Stella Wang on 10/8/25.
//

import SwiftUI

@main
struct PantryApp: App {
    
    @State var document = Document()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(document)
        }
    }
}
