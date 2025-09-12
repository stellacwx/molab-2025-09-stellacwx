import Cocoa

var greeting = "Hello, playground"

// DAY 3



// storing ordered data in arrays
 
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]
// index starts at 0

print(beatles[0])
print(numbers[1])
print(temperatures[2])

beatles.append("Adrian") // adds item to the end
beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")
print(beatles)

// arrays can only hold one type of data at any time
// type safety

var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

var albums = [String]() // another way to initialize an array -- same outcome
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")

// same result as above
var albums1 = ["Folklore"]
albums1.append("Fearless")
albums1.append("Red")

print(albums.count)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2)
print(characters.count)

characters.removeAll()
print(characters.count)

let bondMovies = ["Casino Royale", "Spectre", "No Time to Die"]
print(bondMovies.contains("Frozen"))

let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())
// sorted() sorts strings alphabetically, integers numerically

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed() // keeps the original array preserved inside but "remembers" that it's reversed -- more efficient
print(reversedPresidents) // output is: ReversedCollection<Array<String>>(_base: ["Bush", "Obama", "Trump", "Biden"])



// storing and finding data in dictionaries

var employee = ["Taylor Swift", "Singer", "Nashville"]

print("Name: \(employee[0])")
// employee.remove(at: 1) // causes problems in an array like this
print("Job title: \(employee[1])")
print("LocationL \(employee[2])")

let employee2 = ["name": "Taylor Swift", "job": "Singer", "location": "Nashville"]
// like a map
// "name", "job", and "location" are keys and "Taylor Swift", "Singer", and "Nashville" are values
// follows key : value format
print(employee2["name", default : "Unknown"]) // without providing a default value to use, this gives the "optional" warning as in the thing you want to print out might not actually be there
print(employee2["job", default : "Unknown"])
print(employee2["location", default : "Unknown"])

let hasGraduated = ["Eric" : false, "Maeve" : true, "Otis" : false]

let olympics = [2012 : "London", 2016 : "Rio de Janeiro", 2021 : "Tokyo"]

print(olympics[2012, default: "Unknown"])

// another way to initialize a dictionary
var heights = [String : Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206
// dictionaries do not allow duplicate keys to exist, and will instead overwrite anything with the most recent input

var archEnemies = [String : String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin" // overrides "The Joker"
// dictionaries also have built in properties like .count and .removeAll()



// using sets for fast data lookup

// for sets you must pass in an array of items, not just loose items
let actors = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L. Jackson"]) // creates an array inside the set
// set will automatically remove duplicate values and won't remember the exact order used in the array
print(actors) // you can see it prints them out in no particular order

var actors1 = Set<String>()
actors1.insert("Denzel Washington")
actors1.insert("Tom Cruise")
actors1.insert("Nicolas Cage")
actors1.insert("Samuel L. Jackson")
print(actors1)
// sets are much more efficient at retrieving/lookup of items
// has contains(), count, sorted() (returns a sorted array containing the set's items)



// creating and using enums

// an enum is a set of named values we can create and use in our code
// more efficient and safer to work with

var selected = "Monday"
selected = "Tuesday"
selected = "January" // month instead of day
selected = "Friday " // has an extra space
// enums define a whole new type that is customizable

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    // can also be written as: case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.friday
// for enums, can skip the name of the enum after the first assignment
day = .wednesday

// enums are safer for us to work with and faster for swift to work with!
