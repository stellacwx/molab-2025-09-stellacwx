//
//  TomatoSoup.swift
//  RecipeBook
//
//  Created by Stella Wang on 9/29/25.
//

import SwiftUI
internal import Combine
import AVFoundation

var bellSound: AVAudioPlayer?

struct TomatoSoup: View {
    
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
            
            // top part
            Text("Tomato Soup")
                .font(Font.system(size: 30, weight: .bold))
                .padding()
            ImageThumb(urlString: imageArray[1], w: 200, h: 200);
            
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
            // source: https://www.loveandlemons.com/tomato-soup-recipe/
            ScrollView {
                HStack {
                    Text("Ingredients")
                        .font(Font.system(size: 20, weight: .bold))
                        .padding([.top, .leading])
                    Spacer()
                }
                Text("Recipe from Love and Lemons")
                    .font(Font.system(size: 13))
                    .italic()
                    .padding(1)
                VStack(alignment: .leading) {
                    Text("- 2 tbsp extra-virgin olive oil, plus more for drizzling")
                    Text("- 2 tbsp unsalted butter, or an additional 2 tablespoons olive oil")
                    Text("- 2 medium yellow onions, chopped")
                    Text("- 2 medium carrots, chopped")
                    Text("- 6 garlic cloves, chopped")
                    Text("- 2 tablespoons balsamic vinegar")
                    Text("- 2 (28-ounce) cans diced tomatoes, and their juices")
                    Text("- 3 cups water or vegetable broth")
                    Text("- 1⅓ cups heavy cream, plus more for drizzling")
                    Text("- 1 teaspoon dried thyme")
                    Text("- ½ teaspoon red pepper flakes")
                    Text("- 1 teaspoon sea salt, plus more to taste")
                    Text("- Freshly ground black peppera")
                    Text("- Fresh basil leaves, for garnish")
                }
                .padding([.leading, .bottom])
                HStack {
                    Text("Steps")
                        .font(Font.system(size: 20, weight: .bold))
                        .padding([.top, .leading])
                    Spacer()
                }
                VStack(alignment: .leading) {
                    Text("1. Heat the olive oil and butter in a large pot over medium heat. Add the onion, carrots, garlic, and a pinch of salt and cook, stirring occasionally, for 8 minutes, or until softened.")
                    Text("2. Stir in the vinegar, then add the tomatoes, water, cream, thyme, red pepper flakes, salt, and several grinds of pepper. Simmer, stirring occasionally, for 20 to 25 minutes, or until the carrots are tender.")
                    Text("3. Scoop 4 cups of the soup out of the pot and set aside. Transfer the remaining soup to a blender. Puree until smooth. Return the pureed soup to the pot with the reserved 4 cups of chunky soup. Stir to combine and season to taste.")
                    Text("4. Ladle into bowls and serve with a drizzle of cream, a drizzle of olive oil, freshly ground black pepper, and fresh basil leaves for garnish.")
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

#Preview {
    TomatoSoup()
        .environment(AudioDJ())
}
