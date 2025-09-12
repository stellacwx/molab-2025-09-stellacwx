import Cocoa

var greeting = "Hello, playground"



// DAY 1

// creating variable and constants

var name = "Ted" // variable that can be redefined
name = "Rebecca"
name = "Keeley"

let character = "Daphne" // constant that cannod be modified; will give error

var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

// creating strings

let managerName = "Michael Scott"
let dogBreed = "Samoyed"
let meaningOfLife = "How many roadsmust a man walk down?"

let actor = "Denzel Washington"
let filename = "paris.jpg"
let result = "⭐️You win! ⭐️"

let quote = "Then he tapped a sign saying \"Believe\" and walked away."
let movie = """
A day in
the life of an
Apple engineer
"""

let nameLength = actor.count
print(nameLength)

print(result.uppercased())

print(movie.hasPrefix("A day"))
print(filename.hasSuffix(".jpg")) // strings are case sensitive

// storing whole numbers (integers)

let score = 10
let reallyBig = 100_000_000 // doesn't really matter where the underscores are, they get ignored
let reallyBig2 = 1_00__00___00____00 // same as above

let lowerScore = score - 2
let higherScore = score + 10
let doubleScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2

var counter = 10
counter += 5
print(counter)

counter += 2
counter -= 10
counter /= 2
 
let number = 120
print(number.isMultiple(of: 3))
print(120.isMultiple(of: 3))

// storing decimal numbers

let number2 = 0.1 + 0.2 // considered doubles
print(number2)
// cannot add ints and doubles together -- called "type safety"
let a = 1
let b = 2.0
let c = Double(a) + b

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

var name1 = "Nicolas Cage"
name1 = "John Travolta"
// once a variable is created its type cannot be changed

var rating = 5.0
rating *= 2 // this works
// decimals have the same range of operators that integers do
// swift lets us use doubles and cgfloats interchangeably
