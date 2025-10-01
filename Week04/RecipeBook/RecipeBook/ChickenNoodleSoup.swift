//
//  ChickenNoodleSoup.swift
//  RecipeBook
//
//  Created by Stella Wang on 9/29/25.
//

import SwiftUI
internal import Combine
import AVFoundation

struct ChickenNoodleSoup: View {
    
    @State var slideIndex = 0
    @State var isPlaying = false
    @State var timeinSeconds: Int = 10
    @State var timerOn = false
    @State var showingAlert: Bool = false
    
    // Timer gets called every second.
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @Environment(AudioDJ.self) var audioDJ;
    
    var body: some View {
        VStack {
            Text("Chicken Noodle Soup")
                .font(Font.system(size: 30, weight: .bold))
                .padding()
            ImageThumb(urlString: imageArray[0], w: 200, h: 200);
            
            HStack {
                Spacer()
                // timer button
                Button(action: timerAction) {
                    Image(systemName: "timer")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.black)
                }
                .padding([.top, .bottom])
                // timer
                Text("\(timeinSeconds)")
                .onReceive(timer) { _ in
                    // when timer updates
                    if timerOn {
                        timeinSeconds -= 1
                        if timeinSeconds <= 0 {
                            timeinSeconds = 10
                            timerOn = false
                            timesUp()
                            if isPlaying {
                                playPauseAction()
                            }
                        }
                    }
                }
                // music button
                Button(action: playPauseAction) {
                    Image(systemName: isPlaying ? "pause" : "play")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.black)
                }
                .padding()
                Spacer()
            }
            
            // actual recipe
            // source: https://tastesbetterfromscratch.com/chicken-noodle-soup/
            ScrollView {
                HStack {
                    Text("Ingredients")
                        .font(Font.system(size: 20, weight: .bold))
                        .padding([.top, .leading])
                    Spacer()
                }
                Text("Recipe from Lauren Allen, Tastes Better from Scratch")
                    .font(Font.system(size: 13))
                    .italic()
                    .padding(1)
                VStack(alignment: .leading) {
                    Text("- 1/2 tbsp butter")
                    Text("- 2 ribs celeery, diced")
                    Text("- 3-4 large carrots diced")
                    Text("- 1 clove garlic, minced")
                    Text("- 10 cups chicken stock or broth")
                    Text("- 1 teaspoon salt, to taste")
                    Text("- 1/2 teaspoon freshly ground black pepper, to taste")
                    Text("- 1/8 teaspoon dried rosemary, or more, to taste")
                    Text("- 1/8 teaspoon dried thyme")
                    Text("- 1/8 teaspoon crushed red pepper flakes")
                    Text("- 1 batch homemade egg noodles")
                    Text("- or 4 cups dry egg noodles")
                    Text("- farfalle or other bite-size pasta")
                    Text("- 3 cups rotisserie chicken")
                    Text("- 1 teaspoon chicken bouillon granules")
                }
                .padding([.leading, .bottom])
                HStack {
                    Text("Steps")
                        .font(Font.system(size: 20, weight: .bold))
                        .padding([.top, .leading])
                    Spacer()
                }
                VStack(alignment: .leading) {
                    Text("1. Add butter, diced celery and carrots to a large stock pot over medium-high heat. Saute for 3 minutes. Add garlic and cook for another 30 seconds.")
                    Text("2. Add chicken stock and season the broth with rosemary, thyme, crushed red pepper, and salt (definitely TASTE the broth before adding more salt), and pepper. Taste and add a spoonful of “better than bullion” chicken or chicken bouillon cubes or granules as needed.")
                    Text("3. Bring broth to a boil. Add noodles (either uncooked homemade egg noodles, or dry store-bought pasta) and cook just until noodles are al dente.")
                    Text("4. If using store-bought noodles, be cautious not to overcook them! Remove pot from heat as soon as they are just barely tender. The noodles will continue to cook once you remove the pot from the heat, and you don’t want them mushy.")
                    Text("5. Add chicken meat from the rotisserie chicken. Taste the broth again and add more seasonings, if needed.")
                    Text("6. Store leftovers in an airtight container in the refrigerator for 4-5 days, depending on the freshness of the chicken you used.")
                }
                .padding()
            }
        }
    }
    
    // music
    func playPauseAction() {
        isPlaying.toggle()
        if isPlaying {
            audioDJ.play()
        }
        else {
            audioDJ.stop()
        }
    }
    
    // timer
    func timerAction() {
        timerOn.toggle()
    }
    
    func timesUp() {
        let path = Bundle.main.path(forResource: "bbc_miscellane_07012087.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            bellSound = try AVAudioPlayer(contentsOf: url)
            bellSound?.play()
        } catch {
            // couldn't load file :(
        }
    }
}

// Image(systemName: "timer")
// Image(systemName: "play")

#Preview {
    ChickenNoodleSoup()
        .environment(AudioDJ())
}
