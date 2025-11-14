//
//  GalleryView.swift
//  FoodJournal
//
//  Created by Stella Wang on 11/14/25.
//

import SwiftUI
import UIKit

struct GalleryView: View {
    
    @Environment(Document.self) var document
    
    @State private var showAdd: Bool = false
    @State var photoPickerIsPresented: Bool = false
    @State var photoResult: [UIImage] = []
    @State var newItem: EntryItem = EntryItem()
    @State var selectedItem: EntryItem = EntryItem()
    @State var entryIsPresented: Bool = false
    
    // @State var selectedItemID: UUID? = nil
    // @State var useAmountText: String = ""
    
    var body: some View {
        VStack {
            Text("Journal")
                .font(Font.system(size: 32, weight: .bold, design: .monospaced))
                .padding()
            let columns = [GridItem(.adaptive(minimum: 100))]
            ScrollView {
                if document.model.items.isEmpty {
                    Text("Add an entry!")
                        .font(.system(size: 16, design: .monospaced))
                } else {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(document.model.items) { item in
                            Image(uiImage: UIImage(data: item.itemPicture)!)
                                //.frame(width: 50, height: 50)
                                //.background(.white)
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                //.frame(height: 250, alignment: .center)
                                .cornerRadius(20)
                                .onTapGesture {
                                    selectedItem = item
                                    entryIsPresented = true
                                }
                        }
                    }
                }
            }
            .padding()
            Button("+") {
                showAdd = true
            }
            .padding(20)
            .foregroundStyle(.white)
            .background(Circle())
            .cornerRadius(15)
            .font(.system(size: 32, design: .monospaced))
            Spacer(minLength: 10)
        }
        .overlay() {
            if showAdd {
                //Color.white.ignoresSafeArea()
                    //.frame(width: 350, height: 400).cornerRadius(50)
                    //.border(.black).cornerRadius(50)
                VStack {
                    VStack {
                        ForEach(photoResult, id: \.self) { uiImage in
                            Image(uiImage: uiImage)
                                //.frame(width: 50, height: 50)
                                //.background(.white)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                //.frame(height: 250, alignment: .center)
                                .cornerRadius(20)
                                //.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .padding(.vertical, 10)
                                .padding(.horizontal, 25)
                        }
                    }
                    //.frame(width: 100, height: 100)
                    //.padding()
                    Button("Select Photo") {
                        photoPickerIsPresented.toggle()
                    }
                    .padding(10)
                    .foregroundStyle(.black)
                    .background(.white)
                    .cornerRadius(15)
                    .font(.system(size: 16, design: .monospaced))
                    TextField("Name", text: $newItem.itemName)
                        .padding(10)
                        // .foregroundStyle(.white)
                        .background(.white)
                        .cornerRadius(15)
                        .font(.system(size: 16, design: .monospaced))
                        .frame(width: 200)
                    DatePicker(selection: $newItem.itemDate, label: { Text("Date").foregroundStyle(.white) })
                    //TextField("Date", text: $newItem.itemDate)
                        .padding(10)
                        //.foregroundStyle(.white)
                        .background(.white)
                        .cornerRadius(15)
                        .font(.system(size: 16, design: .monospaced))
                        .frame(width: 200)
                    TextField("Mood", text: $newItem.itemEmotion)
                        .padding(10)
                        //.foregroundStyle(.white)
                        .background(.white)
                        .cornerRadius(15)
                        .font(.system(size: 16, design: .monospaced))
                        .frame(width: 200)
                    TextField("Notes", text: $newItem.itemNotes)
                        .padding(10)
                        //.foregroundStyle(.white)
                        .background(.white)
                        .cornerRadius(15)
                        .font(.system(size: 16, design: .monospaced))
                        .frame(width: 200)
                    HStack {
                        Button("Add") {
                            //guard newItem.itemAmount > 0 else { return }
                            //document.addItem(item: newItem)
                            //newItem = PantryItem()
                            guard !photoResult.isEmpty else { return }
                            newItem.itemPicture = photoResult.first?.pngData() ?? Data()
                            document.addItem(item: newItem)
                            newItem = EntryItem()
                            photoResult = []
                            showAdd = false
                        }
                        .padding(10)
                        .foregroundStyle(.black)
                        .background(.white)
                        .cornerRadius(15)
                        .font(.system(size: 16, design: .monospaced))
                        Button("Cancel") {
                            newItem = EntryItem()
                            photoResult = []
                            showAdd = false
                        }
                        .padding(10)
                        .foregroundStyle(.black)
                        .background(.white)
                        .cornerRadius(15)
                        .font(.system(size: 16, design: .monospaced))
                    }
                }
                .frame(width: 350, height: 750).cornerRadius(50)
                .background(.black)
                .cornerRadius(50)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                // .border(.black).cornerRadius(50)
            }
        }
        //.cornerRadius(50)
        .sheet(isPresented: $photoPickerIsPresented) {
            PhotoPicker(pickerResult: $photoResult,
                        isPresented: $photoPickerIsPresented)
        }
        .overlay() {
            if entryIsPresented {
                VStack {
                    Image(uiImage: UIImage(data: selectedItem.itemPicture)!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        //.aspectRatio(1, contentMode: .fit)
                        .cornerRadius(20)
                        .padding(20)
                    Text(selectedItem.itemName)
                        .padding(10)
                        // .foregroundStyle(.white)
                        .background(.white)
                        .cornerRadius(15)
                        .font(.system(size: 16, weight: .bold, design: .monospaced))
                        .frame(width: 200)
                    Text(selectedItem.itemDate.formatted())
                    //TextField("Date", text: $newItem.itemDate)
                        .padding(10)
                        //.foregroundStyle(.white)
                        .background(.white)
                        .cornerRadius(15)
                        .font(.system(size: 16, design: .monospaced))
                        .frame(width: 200)
                    Text(selectedItem.itemEmotion)
                        .padding(10)
                        //.foregroundStyle(.white)
                        .background(.white)
                        .cornerRadius(15)
                        .font(.system(size: 16, design: .monospaced))
                        .frame(width: 200)
                    Text(selectedItem.itemNotes)
                        .padding(10)
                        //.foregroundStyle(.white)
                        .background(.white)
                        .cornerRadius(15)
                        .font(.system(size: 16, design: .monospaced))
                        .frame(width: 200)
                    HStack {
                        Button("Delete Entry") {
                            document.deleteItem(id: selectedItem.id)
                            entryIsPresented = false
                            selectedItem = EntryItem()
                        }
                        .padding(10)
                        .foregroundStyle(.black)
                        .background(.gray)
                        .cornerRadius(15)
                        .font(.system(size: 16, design: .monospaced))
                        /*
                        Button("Edit") {
                            
                        }
                        .padding(10)
                        .foregroundStyle(.black)
                        .background(.white)
                        .cornerRadius(15)
                        .font(.system(size: 16, design: .monospaced))
                         */
                        Button("Close") {
                            entryIsPresented = false
                            selectedItem = EntryItem()
                        }
                        .padding(10)
                        .foregroundStyle(.black)
                        .background(.gray)
                        .cornerRadius(15)
                        .font(.system(size: 16, design: .monospaced))
                    }
                    .padding(20)
                }
                //.frame(width: 350, height: 750).cornerRadius(50)
                .padding(20)
                .background(.black)
                .cornerRadius(50)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(Document())
}
