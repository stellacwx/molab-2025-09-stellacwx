import Cocoa

var greeting = "Hello, playground"

// DAY 10

// structs

// creating structs

struct Album { // starts with capital
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

struct Employee {
    // properties
    let name: String
    var vacationRemaining: Int = 14 // default value for property
    // methods
    mutating func takeVacation(days: Int) { // must add mutating keyword
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

// instance = initializer
var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
// must be var to be able to call mutating functions
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

let kane = Employee(name: "Lana Kane")
let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)



// computing property values dynamically

// structs have two kinds of properties, stored properties and computed properties
// computed properties are a blend of stored properties and methods


struct Employee1 {
    // stored properties
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    // computed property -- getter
    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
}

var archer1 = Employee1(name: "Sterling Archer", vacationAllocated: 14)
archer1.vacationTaken += 4
print(archer1.vacationRemaining)
archer1.vacationTaken += 4
print(archer1.vacationRemaining)

struct Employee2 {
    // stored properties
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    // computed property -- getter
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }

        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer2 = Employee2(name: "Sterling Archer", vacationAllocated: 14)
archer2.vacationTaken += 4
archer2.vacationRemaining = 5
print(archer2.vacationAllocated)



// taking action when a property changes

/*
struct Game {
    var score = 0
}

 var game = Game()
game.score += 10
print("Score is now \(game.score)")
game.score -= 3
print("Score is now \(game.score)")
game.score += 1
*/

// property observer
// didSet
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

struct App {
    // willSet executes right before and didSet executes right after
    // oldValue and newValue are built into Swift
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")



// creating custom initializers

struct Player {
    let name: String
    let number: Int
}

// memberwise initializer
let player = Player(name: "Megan R", number: 15)


struct Player1 {
    let name: String
    let number: Int

    init(name: String, number: Int) { // no explicit return type
        self.name = name // self indicates property
        self.number = number
    }
}

struct Player2 {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

// you can call other methods of your struct inside your initializer, you can’t do so before assigning values to all your properties

// memberwise initializer will be gone once custom initializers are created unless extra steps are taken to maintain it

let player1 = Player2(name: "Megan R")
print(player1.number)
