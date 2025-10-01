//
//  RecipeBookApp.swift
//  RecipeBook
//
//  Created by Stella Wang on 9/29/25.
//

import SwiftUI

@main
struct RecipeBookApp: App {
    @State var audioDJ = AudioDJ()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(audioDJ)
        }
    }
}
