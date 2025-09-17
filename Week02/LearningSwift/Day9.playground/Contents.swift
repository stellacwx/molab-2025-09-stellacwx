import Cocoa

var greeting = "Hello, playground"

// DAY 9

// closures

// creating and using closures

func greetUser() {
    print("Hi there!")
}

greetUser()

// copying a function
var greetCopy = greetUser
greetCopy()

// closure: assign a functionality directly to a constant/variable
let sayHello = {
    print("Hi there!")
}
// basically a function that takes no parameters and returns nothing
sayHello()

let sayHello1 = { (name: String) in // parameters and return type are inside the brackets
    "Hi \(name)!"
}

// type annotation for function that returns nothing
var greetCopy1: () -> Void = greetUser

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}
// type annotation for function that takes an Int and returns a String
// doesn't use parameter names, only cares about types
let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}
// custom sort order
let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

// (1) we can create closures as anonymous functions, storing them inside constants and variables
// (2) we’re also able to pass functions into other functions, just like we passed captainFirstSorted() into sorted()

// passing in a closure rather than a separately defined function
// the body of the function/code doesn't change with a closure, just the heading
// closures cannot use external parameter labels
let captainFirstTeam1 = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})



// using trailing closures and shorthand syntax

// original full length code
let captainFirstTeam2 = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})

print(captainFirstTeam2)
 
// shorthand
let sorted = team.sorted { a, b in
    if a == "Suzanne" {
        return true
    } else if b == "Suzanne" {
        return false
    }

    return a < b
}

// $0 is first parameter and $1 is second parameter in shorthand
let sorted1 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}

// to reverse sort an array
let reverseTeam = team.sorted { $0 > $1 }

// filter function lets us run some code on eveery item in the array
let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

// map function lets us transform every item in the array
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)



// accepting functions as parameters

func greetUser1() {
    print("Hi there!")
}

greetUser1()

var greetCopy2: () -> Void = greetUser
greetCopy2()

// passing a function in the parameter (the second parameter)
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}

// now we can make arbitrary sizes integer arrays
let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)

// same works with dedicated functions
func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

// accepting multiple function parameters
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

// three trailing closures
doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}



/* summary
 - you can copy functions in Swift, and they work just like the originals except external parameter names
 - functions have types based on parameter and return
 - you can create closures directly by assigning to a constant or variable
 - closure parameters and return value are declared inside their braces followed by keyword in
 - functions re able to accept other functions as parameters
 - anywhere you can pass a function, you can also pass a closure
 - when passing a closure as a function parameter, you don't need to write the types inside your closure if Swift can infer it
 - if a function's final parameter(s) are functions, using trailing closure syntax
 - you can also use shorthand parameter names such as $0 and $1
 - you can make your own functions that accept functions as parameters
 */



// checkpoint 5
// (1) filter out even numbers (2) sort in ascending order (3) map to strings in the format "7 is a lucky number" (4) print the resulting array, one item per line

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

func printLuckyNumbers(_ numbers: [Int]) {
    let finalNumbers = numbers.filter { $0 % 2 != 0} .sorted().map { "\($0) is a lucky number." }
    for line in finalNumbers {
        print(line)
    }
}
printLuckyNumbers(luckyNumbers)
