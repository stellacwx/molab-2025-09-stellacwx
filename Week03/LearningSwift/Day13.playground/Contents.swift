import Cocoa

var greeting = "Hello, playground"

// DAY 13

// creating and using protocols

/*
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set } // means it must be readable and writable, as in must be a variable
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

// protocol is the list of bare minimum requirements
struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car, bike], distance: 150)
 */

// can conform to as many protocols as you want -- list them by functions



// opaque return types

// know what they mean and what they do

func getRandomNumber() -> Int {
    Int.random(in: 1...6)
}

func getRandomBool() -> Bool {
    Bool.random()
}

// both conform to Seift protocol Equatable, meaning they can be compared for equality
print(getRandomNumber() == getRandomNumber())

// they can return an Equatable value
/*func getRandomNumber1() -> Equatable {
    Int.random(in: 1...6)
}

func getRandomBool1() -> Equatable {
    Bool.random()
} */
// but this doesn't make sense
// hiding the information is useful but not in this instance
// opaque return types let ushide info in our code but not from the Seift compiler

func getRandomNumber1() -> some Equatable { // allows us to change our mind later, but Swift always knows what we're returning
    Int.random(in: 1...6)
}

func getRandomBool1() -> some Equatable {
    Bool.random()
}

protocol View {  }



// creating and using extensions

var quote = "   The truth is rarely pure and never simple   "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

// extension
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

let trimmed1 = quote.trimmed()

// global function
func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}

let trimmed2 = trim(quote)

/* extension vs. global function
 - code completion
 - code organization -- naturally grouped by the type of data they apply to
 - internal access -- full access to the type's internal data
 */

extension String {
    mutating func trim() {
        self = self.trimmed()
    }
}

quote.trim()

// swift naming guidelines: returning new values should use names that end with -ed, like trimmed(), reversed(), etc.
// returning modified self use present tense
// can only be computed properties not stored properties

extension String {
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

// extensions make code easier to write, read, and maintain in the long term

// implementing a custom struct initializer in an extension won't disble the automatic memberwise initializer

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}



// creating and using protocol extensions

extension Collection { // extends sets, dictionaries, arrays
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

/* summary
 - protocols are like contracts for code -- specify methods and properties that are required, and conforming types must implement them
 - opaque return types let us hide some information in our code -- helps to maintain flexibility in our code for the future
 - extensions let us add functionality to existing types
 - protocol extensions let us add functionality to many types all at once
 */



// checkpoint 8

/*
 make a protocol that describes a building
 - should have Int storing amount of rooms, Int for cost, String containing name of the real estate agent, method for printing the sales summary of the building
 - create two structs, House and Office, that conform to it
 */

protocol Building {
    var rooms: Int { get }
    var cost: Int { get }
    var agent: String { get }
    func printSalesSummary()
}

struct House: Building {
    let rooms: Int
    let cost: Int
    let agent: String
    func printSalesSummary() {
        print("This house, sold by \(agent), has \(rooms) rooms and costs \(cost) dollars.")
    }
}

struct Office: Building {
    let rooms: Int
    let cost: Int
    let agent: String
    func printSalesSummary() {
        print("This office, sold by \(agent), has \(rooms) rooms and costs \(cost) dollars.")
    }
}
