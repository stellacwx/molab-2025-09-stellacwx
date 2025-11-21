//
//  EntryView.swift
//  FoodJournal
//
//  Created by Stella Wang on 11/14/25.
//

import SwiftUI

struct EntryView: View {
    
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
        
        
        //.cornerRadius(50)
        .sheet(isPresented: $photoPickerIsPresented) {
            PhotoPicker(pickerResult: $photoResult,
                        isPresented: $photoPickerIsPresented)
        }
    }
}

#Preview {
    EntryView()
        .environment(Document())

}
