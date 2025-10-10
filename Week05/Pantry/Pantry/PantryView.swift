//
//  PantryView.swift
//  Pantry
//
//  Created by Stella Wang on 10/8/25.
//

import SwiftUI

struct PantryItem {
    var itemName: String = ""
    var itemIcon: String = ""
    var itemAmountText: String = "0"
    var itemAmount: Int { Int(itemAmountText) ?? 0 }
}

struct PantryView: View {
    @AppStorage("items") var itemsText: String = ""
    
    @State private var showAdd: Bool = false
    @State private var showUse: Bool = false
    @State private var showList: Bool = false
    @State private var showRunningLow: Bool = false
    @State private var showShoppingList: Bool = false
    
    @State var newItem: PantryItem = PantryItem()

    // items in the pantry as an array, working with itemsText AppStorage string
    /*
    var items: [PantryItem] {
        get {
            var items: [PantryItem] = []
            for i in itemsText.split(separator: "\n") {
                let array = i.split(separator: ",")
                var stringArray: [String] = []
                for j in array {
                    stringArray.append(String(j))
                }
                items.append(PantryItem(itemName: stringArray[0], itemIcon: stringArray[1], itemAmountText: stringArray[2]))
            }
            return items
        }
        set {
            
        }
    }
     */
    
    //@State private var pantryItems: [PantryItem] = []
    
    var body: some View {
        ZStack {
            Color.cream.ignoresSafeArea()
            // buttons on the top
            VStack {
                HStack {
                    /*
                    Button("Shopping List") {
                        showShoppingList = true
                    }
                    .padding(10)
                    .foregroundStyle(Color.cream)
                    .background(Color.ocean)
                    .cornerRadius(15)
                    .font(.system(size: 16, design: .monospaced))
                    // .padding(.trailing, 90)
                     */
                    NavigationLink(destination: ContentView().navigationBarBackButtonHidden()) {
                        Text("Close pantry")
                            .padding(10)
                            .foregroundStyle(Color.cream)
                            .background(Color.ocean)
                            .cornerRadius(15)
                            .font(.system(size: 16, design: .monospaced))
                    }
                }
                .padding(5)
                Spacer()
                ShelfView()
                //Spacer()
                // buttons on the bottom
                HStack {
                    Button("Add") {
                        showAdd = true
                    }
                    .frame(width: 60, height: 40)
                    .padding(10)
                    .foregroundStyle(Color.cream)
                    .background(Color.ocean)
                    .cornerRadius(15)
                    .font(.system(size: 16, design: .monospaced))
                    Button("Use") {
                        showUse = true
                    }
                    .frame(width: 60, height: 40)
                    .padding(10)
                    .foregroundStyle(Color.cream)
                    .background(Color.ocean)
                    .cornerRadius(15)
                    .font(.system(size: 16, design: .monospaced))
                    Button("List") {
                        showList = true
                    }
                    .frame(width: 60, height: 40)
                    .padding(10)
                    .foregroundStyle(Color.cream)
                    .background(Color.ocean)
                    .cornerRadius(15)
                    .font(.system(size: 16, design: .monospaced))
                    /*
                    Button("Running low") {
                        showRunningLow = true
                    }
                    .frame(width: 60, height: 40)
                    .padding(10)
                    .foregroundStyle(Color.cream)
                    .background(Color.ocean)
                    .cornerRadius(15)
                    .font(.system(size: 13, design: .monospaced))
                     */
                }
            }
        }
        .overlay() {
            
            // press Add button
            if showAdd {
                // @State var newItem: PantryItem = PantryItem()
                // var array = items
                Color.autumn.ignoresSafeArea()
                    .frame(width: 300, height: 300)
                    .cornerRadius(20)
                VStack {
                    Text("Add an item to the pantry:")
                        .padding(15)
                        .foregroundStyle(Color.cream)
                        .font(.system(size: 16, design: .monospaced))
                    TextField("Name", text: $newItem.itemName)
                        .padding(10)
                        .foregroundStyle(Color.cream)
                        .background(Color.copper)
                        .cornerRadius(15)
                        .font(.system(size: 16, design: .monospaced))
                        .frame(width: 200)
                    TextField("Icon", text: $newItem.itemIcon)
                        .padding(10)
                        .foregroundStyle(Color.cream)
                        .background(Color.copper)
                        .cornerRadius(15)
                        .font(.system(size: 16, design: .monospaced))
                        .frame(width: 200)
                    TextField("Amount", text: $newItem.itemAmountText)
                        .padding(10)
                        .foregroundStyle(Color.cream)
                        .background(Color.copper)
                        .cornerRadius(15)
                        .font(.system(size: 16, design: .monospaced))
                        .frame(width: 200)
                    Button("Add") {
                        if newItem.itemAmount > 0 {
                            itemsText.append("\(newItem.itemName),\(newItem.itemIcon),\(newItem.itemAmount)\n")
                        }
                        newItem = PantryItem()
                        showAdd = false
                    }
                    .padding(10)
                    .foregroundStyle(Color.cream)
                    .background(Color.copper)
                    .cornerRadius(15)
                    .font(.system(size: 16, design: .monospaced))
                }
            }
            
            // press Use button
            if showUse {
                Color.autumn.ignoresSafeArea()
                    .frame(width: 300, height: 300)
                    .cornerRadius(20)
                VStack {
                    Button("Clear pantry") {
                        itemsText = ""
                    }
                    .padding(10)
                    .foregroundStyle(Color.cream)
                    .background(Color.copper)
                    .cornerRadius(15)
                    .font(.system(size: 16, design: .monospaced))
                    Button("Close") {
                        showUse = false
                    }
                    .padding(10)
                    .foregroundStyle(Color.cream)
                    .background(Color.copper)
                    .cornerRadius(15)
                    .font(.system(size: 16, design: .monospaced))
                }
            }
            
            // press List button
            if showList {
                ZStack {
                    Color.autumn.ignoresSafeArea()
                        .frame(width: 350, height: 400)
                        .cornerRadius(20)
                    VStack {
                        Text("My Pantry")
                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                            .foregroundStyle(Color.cream)
                            .padding(.top, 20)
                        ScrollView {
                            let items = itemsText.split(separator: "\n")
                            if itemsText.isEmpty {
                                Text("You have no items in your pantry.")
                                    .font(.system(size: 16, design: .monospaced))
                                    .foregroundStyle(Color.cream)
                            } else {
                                VStack {
                                    ForEach(Array(items), id: \.self) { item in
                                        let array = item.split(separator: ",")
                                        if array.count == 3 {
                                        let name = array[0]
                                        let icon = array[1]
                                        let amount = array[2]
                                        
                                        HStack(spacing: 8) {
                                            Text(icon)
                                                .font(.system(size: 16, design: .monospaced))
                                                .foregroundStyle(Color.cream)
                                            Text(name)
                                                .font(.system(size: 16, design: .monospaced))
                                                .foregroundStyle(Color.cream)
                                            Spacer()
                                            Text(amount)
                                                .font(.system(size: 16, design: .monospaced))
                                                .foregroundStyle(Color.cream)
                                        }
                                        .font(.system(size: 16, design: .monospaced))
                                        .foregroundStyle(Color.cream)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(10)
                        Button("Close") {
                            showList = false
                        }
                        .padding(10)
                        .foregroundStyle(Color.cream)
                        .background(Color.copper)
                        .cornerRadius(15)
                        .font(.system(size: 16, design: .monospaced))
                        Spacer(minLength: 10)
                    }
                }
                .frame(width: 350, height: 400)
            }
            
            
            
            
            // press Running low button
            if showRunningLow {
                Color.autumn.ignoresSafeArea()
                    .frame(width: 350, height: 400)
                    .cornerRadius(20)
                Button("Close") {
                    showRunningLow = false
                }
                .padding(10)
                .foregroundStyle(Color.cream)
                .background(Color.copper)
                .cornerRadius(15)
                .font(.system(size: 16, design: .monospaced))
            }
            // press Shopping list button
            if showShoppingList {
                Color.autumn.ignoresSafeArea()
                    .frame(width: 350, height: 400)
                    .cornerRadius(20)
                Button("Close") {
                    showShoppingList = false
                }
                .padding(10)
                .foregroundStyle(Color.cream)
                .background(Color.copper)
                .cornerRadius(15)
                .font(.system(size: 16, design: .monospaced))
            }
        }
    }
}

#Preview {
    PantryView()
}
