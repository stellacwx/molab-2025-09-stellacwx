import Cocoa

var greeting = "Hello, playground"

// DAY 11

// limiting access to internal data using access control

struct BankAccount {
    private var funds = 0 // make it private!

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

// private: don't let anything outside the struct use this
// fileprivate: don't let anything outside the current file use this
// public: let anyone anywhere use it
// private(set): let anyone read this property, but only internal methods can write it

// swift cannot generate memberwise initializer for private properties -- must be done manually



// static properties and methods

// simplified example
struct School {
    static var studentCount = 0

    static func add(student: String) { // don't need mutating keyword
        print("\(student) joined the school.")
        studentCount += 1
    }
}
// cannot reference regular properties/methods from static properties/methods, but can do the other way around

School.add(student: "Taylor Swift")
print(School.studentCount)

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

// using static to make an example for easy reference
struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}



/* summary
 - you can create your own structs using the struct keyword
 - structs can have their own properties and methods
 - if a method modifies properties of its struct, it must be mutating
 - structs can have stored properties and computed properties
 - we can attach didSet and willSet property observers to properties
 - Swift generates an initializer for all structs using their property names
 - you can create custom initializers to override swift's default
 - access control limits what code can use properties and methods
 - static properties and methods are attached directly to a struct
 */



// checkpoint 6

// struct to store information of car -- model, number of seats, current gear
// method to change gears up or down
// think about variables and access control
// don't allow invalid gears (keep range 1-10)

struct Car {
    let model: String
    let seats: Int
    private var currentGear: Int
    
    init(model: String, seats: Int, currentGear: Int) {
        self.model = model
        self.seats = seats
        self.currentGear = currentGear
    }
    
    mutating func increaseGear() {
        if currentGear < 10 {
            currentGear += 1
        } else {
            print("Invalid gear.")
        }
    }
    
    mutating func decreaseGear() {
        if currentGear > 1 {
            currentGear -= 1
        } else {
            print("Invalid gear.")
        }
    }
}

var myCar = Car(model: "Acura MDX", seats: 7, currentGear: 1)
myCar.decreaseGear()
myCar.increaseGear()
