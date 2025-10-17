//
//  ShelfView.swift
//  Pantry
//
//  Created by Stella Wang on 10/9/25.
//

import SwiftUI

struct ShelfView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 350, height: 15)
                .foregroundStyle(Color.copper)
                .padding(60)
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 350, height: 15)
                .foregroundStyle(Color.copper)
                .padding(60)
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 350, height: 15)
                .foregroundStyle(Color.copper)
                .padding(60)
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 350, height: 15)
                .foregroundStyle(Color.copper)
                .padding(60)
        }
    }
}

#Preview {
    ShelfView()
}
