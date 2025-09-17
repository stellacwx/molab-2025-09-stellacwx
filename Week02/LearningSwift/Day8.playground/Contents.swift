import Cocoa

var greeting = "Hello, playground"

// DAY 8

// providing default values for parameters

func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true) // default is false
print(characters.count)



// handling errors in functions

// three steps: (1) tell Swift about the possible errors that can happen (2) write a function that can flag up errors if they happen (3) call that function and handle any errors that might happen
enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short // immediately exits the function
    }

    if password == "12345" {
        throw PasswordError.obvious // immediately exits the function
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

// use try and catch keywords to check for errors
let string = "12345"

do {
    let result = try checkPassword(string) // try must be written for all throwing functions to signal handling errors. all must use do and catch with try
    print("Password rating: \(result)")
} catch {
    print("There was an error.")
}
// must always have a catch block that handles every kind of error, but can also catch specific errors



/*
 summary
 - functions let us reuse code by carving off chunks and giving it a name
 - functions start with the keyword func, followed by the function's name
 - funcitons can accept parameters to control their behavior
 you can add cusstom external parameter names, or use _ to skip one
 - function parameters can have default values for common scenarios
 - functions can optionally return a value, but you can return multiple pieces of data from a function using a tuple
 - functions can throw errors using do, try, and catch -- make sure to catch all possible errors
 */



// checkpoint 4

// write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number
// cannot use the built in sqrt() function or similar
// if the number is less than 1 or greater than 10,000 you should throw an "out of bounds" error
// you should only consider square roots
// if you can't find the square root, throw a "no root" error

func sqrtThrough10000(_ int: Int) throws -> Int {
    var root = -1;
    if (int < 1) {
        throw OutOfBounds.tooSmall
    } else if (int > 10000) {
        throw OutOfBounds.tooLarge
    }
    else {
        for i in 1...(10_000/int) {
            if i*i == int {
                return i
            }
        }
    }
    if root == -1 {
        throw NoRoot.noRoot
    }
}

enum OutOfBounds: Error {
    case tooLarge, tooSmall
}

enum NoRoot: Error {
    case noRoot
}

do {
    let root = try sqrtThrough10000(10001)
    print("Square root: \(root)")
} catch {
    print("Out of bounds.")
}

do {
    let root = try sqrtThrough10000(169)
    print("Square root: \(root)")
} catch {
    print("Out of bounds.")
}

do {
    let root = try sqrtThrough10000(743)
    print("Square root: \(root)")
} catch is OutOfBounds {
    print("Out of bounds")
} catch {
    print("There was an error.")
}
