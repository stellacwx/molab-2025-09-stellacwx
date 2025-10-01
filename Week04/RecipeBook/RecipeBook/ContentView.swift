//
//  ContentView.swift
//  RecipeBook
//
//  Created by Stella Wang on 9/29/25.
//

import SwiftUI

let imageArray = [
  "https://tastesbetterfromscratch.com/wp-content/uploads/2017/10/Chicken-Noodle-Soup-2-300x300.jpg",
  "https://cdn.loveandlemons.com/wp-content/uploads/2023/01/tomato-soup-recipe.jpg"
]

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Recipe Book")
                    .padding()
                    .font(.largeTitle)
                HStack {
                    // Image(uiImage: imageFor(string: item.urlStr))
                    // .resizable()
                    // .frame(width:100, height: 100)
                    ImageThumb(urlString: imageArray[0]);
                    NavigationLink(destination: ChickenNoodleSoup()) {
                        Text("Chicken Noodle Soup")
                            .padding()
                    }
                    Spacer()
                }
                HStack {
                    // Image(uiImage: imageFor(string: item.urlStr))
                    // .resizable()
                    // .frame(width:100, height: 100)
                    ImageThumb(urlString: imageArray[1]);
                    NavigationLink(destination: TomatoSoup()) {
                        Text("Tomato Soup")
                            .padding()
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct ImageThumb: View {
    var urlString: String
    var w: CGFloat = 100
    var h: CGFloat = 100
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
            if let image = phase.image {
                image // Displays the loaded image.
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: w, height: h)
            } else if phase.error != nil {
                Color.red // Indicates an error.
            } else {
                //        Color.blue  //Acts as a placeholder.
                ProgressView()
            }
        }
    }
}


#Preview {
    ContentView()
        .environment(AudioDJ())
}
