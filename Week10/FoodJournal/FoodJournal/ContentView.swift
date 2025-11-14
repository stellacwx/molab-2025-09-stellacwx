//
//  ContentView.swift
//  FoodJournal
//
//  Created by Stella Wang on 10/20/25.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @Environment(Document.self) var document
    
    var body: some View {
        GalleryView();
    }
}

#Preview {
    ContentView()
        .environment(Document())
}
