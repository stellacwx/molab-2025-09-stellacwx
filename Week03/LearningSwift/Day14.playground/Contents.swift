import Cocoa

var greeting = "Hello, playground"

// DAY 14

// optionals

// handling missing data with optionals

let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
let peachOpposite = opposites["Peach"]
// peachOpposite's type is String?
// optionals: data that might be present, but might not be
// swift will not let us use code that might not be there
// optionals must be unwrapped

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

// no value
var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

// schrodinger's data type

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
// print(square(number: number)) // doesn't work

if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}

// very common to unwrap an optional into a conxtant with the same name



// unwrapping optionals with guard

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }

    print("\(number) x \(number) is \(number * number)")
}
// flips things around from if let

// if let only runs if myVar has a value inside
// guard only runs if myVar doesn't have a value inside

// Swift requires you to use return and exit the function if a guard check fails
// if the optional unwrapped has a value, you can use it after the guard code finishes

// use if let to unwrap optionals to process them somehow, and use guard let to ensure optionals have something inside them and exit otherwise

// you can use guard with any condition, including ones that don't unwrap optionals



// unwrapping optionals with nil coalescing

let captains = ["Enterprise": "Picard", "Voyager": "Janeway", "Defiant": "Sisko"]

// new will not be an optional
let new = captains["Serenity"] ?? "N/A"
// same result
let new1 = captains["Serenity", default: "N/A"]
// nil coalescing works with dictionaries and any optionals

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

// struct with an optional property and provide a sensible default for when it's missing
struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

// provides default value in case of invalid integer
let input = ""
let number1 = Int(input) ?? 0
print(number1)



// handling multipls optionals using optional chaining

// using optionals inside optionals

let names = ["Arya", "Bran", "Robb", "Sansa"]

// if the optional has a value, unwrap it and make it uppercased
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

/*
 optional instance of a Book struct
 might have an author, might be anonymous
 if it has an author, attempt to read the first letter
 if the first letter is there, uppercase it
 */
struct Book1 {
    let title: String
    let author: String?
}

var book1: Book1? = nil
let author1 = book1?.author?.first?.uppercased() ?? "A"
print(author)



// handling function failure with optionals

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)



/* summary
 - optionals let us represent the absence of data
 - everything that isn't optional definitely has a value inside
 - unwrapping looks inside the optional: if there's a value it's sent back
 - if let runs code if the optional has a value; guard let runs code if the optional doesn't have a value
 - ?? unwraps and returns an optional's value, or a default value instead
 - optional chaining reads an optional inside another optional
 - try? can convert throwing functions so they return an optional
 */



// checkpoint 9

/*
 write a function that accepts an optional array of integers and returns one of them randomly
 - if the array is missing or empty, return a new random number in the rand 1 through 100
 - write your function in a single line of code
 */

func randomInt(array: [Int]?) -> Int { return array?.randomElement() ?? Int.random(in: 1...100) }

print(randomInt(array: [1, 5, 9]))
print(randomInt(array: nil))
