import Cocoa

var greeting = "Hello, playground"

// DAY 7

// reusing code with functions

func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

showWelcome() // considered a function's call site

// with a parameter -- customization point
func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTables(number: 5, end: 20) // parameters must be passed in in order



// returning values from functions

func rollDice() -> Int {
    return Int.random(in: 1...6)
}
let result = rollDice()
print(result)

func check(m: String, n: String) -> Bool {
    m.sorted() == n.sorted() // when there's only one line in a function that returns a value you can just remove the return keyword
}

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}
let c = pythagoras(a: 3, b: 4)
print(c)

func sayHello() {
    return
}



// returning multiple values frorm functions

func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

// using an array to return multiple values, not the most optimized way to do it
func getUser1() -> [String] {
    ["Taylor", "Swift"]
}
let user1 = getUser1()
print("Name: \(user1[0]) \(user1[1])")

// tuples
func getUser() -> (String, String) {
    ("Taylor", "Swift") // again when just one line of code, not need to specify; same logic as return keyword
    // full line: (firstName: "Taylor", lastName: "Swift")
}

/*
 full code looks like this:
 func getUser() -> (firstName: String, lastName: String) {
     (firstName: "Taylor", lastName: "Swift")
 }

 let user = getUser()
 print("Name: \(user.firstName) \(user.lastName)")
 */

let user = getUser()
// print("Name: \(user.firstName) \(user.lastName)")
//print("Name: \(user.0) \(user.1)")
let (firstName, lastName) = getUser()
print("Name: \(firstName) \(lastName)")
let (firstName1, _) = getUser() // if not using one of the variables
print("Name: \(firstName1)")

// tuples cannot grow in size like arrays can



// customizing parameter labels

// can have different functions that have the same name but with different parameter names
func hireEmployee(name: String) { }
func hireEmployee(title: String) { }
func hireEmployee(location: String) { }

let lyric = "I see a red door and I want it painted black"
print(lyric.hasPrefix("I see"))

func isUpperCase(_ string: String) -> Bool { // the underscore removes the external parameter name
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result1 = isUpperCase(string) // doesn't have to be written as let result = isUppercase(string: string)

// external parameter name (for) and internal parameter name (number)
// technically external parameter name is argument name and internal parameter name is parameter name but it's ok
func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)
