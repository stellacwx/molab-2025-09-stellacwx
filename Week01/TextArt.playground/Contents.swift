import Cocoa
import Foundation


// Following the example in the homework assignment, I created one playground that generates a random 5x5 text art using color blocks with code that made more sense to me. I also created a function that generates a sunset using the same blocks. For both, I first tried to fit everything into their respective functions, but I found making helper functions made the code shorter and easier to navigate. I created one helper function that generates a random color block, and then one helper function that generates a solid line of color. Lastly, using the same generateSolidColorLine function, I created a function that generates a rainbow whose length depends on what is passed into the function. Creating the functions was very manageable once I created the helper functions. One issue is that I don’t know if there would be a more consistent way to write the code, since the first function pulls the colors from an array of Strings while the other two just create the color as a String within the function. However, I had no issues with the code not running or any bugs.

let colors = ["🟥", "🟧", "🟨", "🟩", "🟦", "🟪"]

// generates a random 5x5 block of text art
func generateRandom() {
    for _ in 0..<5 {
        var line = ""
        for _ in 0..<5 {
            line += randomColor()
        }
        print(line)
    }
}

// generates a random color
func randomColor() -> String {
    let randomInt = Int.random(in: 0..<colors.count)
    return colors[randomInt]
}

// generates a 5x5 sunset
func generateSunset() {
    print("Here is a sunset:")
    generateSolidColorLine(color: "🟪", number: 5)
    generateSolidColorLine(color: "🟥", number: 5)
    print(colors[1] + colors[1] + colors[2] + colors[1] + colors[1])
    generateSolidColorLine(color: "🟦", number: 5)
    generateSolidColorLine(color: "🟦", number: 5)
}

// generates a line of a chosen amount of the same color
func generateSolidColorLine(color: String, number: Int) {
    var line = ""
    for _ in 0..<number {
        line += color
    }
    print(line)
}

// generates a rainbow of desired length
func generateRainbow(length: Int) {
    print("Here is a rainbow that is \(length) blocks long:")
    generateSolidColorLine(color: "🟥", number: length)
    generateSolidColorLine(color: "🟧", number: length)
    generateSolidColorLine(color: "🟨", number: length)
    generateSolidColorLine(color: "🟩", number: length)
    generateSolidColorLine(color: "🟦", number: length)
    generateSolidColorLine(color: "🟪", number: length)
}

generateRandom()
print("")
generateSunset()
print("")
generateRainbow(length: 10)
print("")
generateRainbow(length: 3)

