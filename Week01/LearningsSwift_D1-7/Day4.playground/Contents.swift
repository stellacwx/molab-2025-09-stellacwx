import Cocoa

var greeting = "Hello, playground"

// DAY 4

// using type annotations

let surname = "Lasso"
var score = 0
// here swift is using type inference

//type annotations allow us to be specific about what we want
let suranme1: String = "Lasso"
var score1: Int = 0
var score2: Double = 0 // forces it to be a decimal number

let playerName: String = "Roy"
let luckyNumber: Int = 13
let pi: Double = 3.141
var isAuthenticated: Bool = true

var albums: [String] = ["Red", "Fearless"]
var user: [String : String] = ["id" : "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

var soda: [String] = ["Coke", "Pepsi", "Dr. Pepper"]
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()
// these three all make an empty array of Strings, depends on if you want type annotation or not

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light
style = .dark

var style1: UIStyle = .light

let username: String
username = "@twostraws"
print(username)

/*
 summary
 - arrays store many values in one placee, and read them using indices.
 - dictionaries also store many values, nd read them using keys we specify
 - sets store many values in one place, but we don't choose their order
 - enums create our own types to specify a range of acceptable values
 - swift uses type inference to figure what data we're storing
 - it's also possible to use type annotation to force a particular type
 - arrays will be used most often, then dictionaries, then sets
 */



// checkpoint 2

let strings = ["a", "b", "c", "d", "e", "e"]
let stringSet = Set(strings)
print("There are \(strings.count) total items in the array and \(stringSet.count) unique items in the array.")
