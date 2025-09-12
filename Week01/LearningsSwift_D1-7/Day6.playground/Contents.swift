import Cocoa

var greeting = "Hello, playground"

// DAY 6

// using a for loop to repeat work

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

// similar to a for-each loop
for os in platforms { // "os" is the loop variable
    print("Swift works great on \(os).")
} // similar to java

// looping over a fixed range of numbers. similar to a for loop
for i in 1...12 { // up to AND including 12
    print("5 x \(i) is \(5 * i)")
}

// nested loop
for i in 1...12 {
    print("The \(i) times table:")
    for j in 1...12 {
        print("  \(j) x \(i) is \(j * i)")
    }
    print()
}

for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

for i in 1..<5 {
    print("Counting from 1 up to 5: \(i)")
}

var lyric = "Haters gonna"

// when the loop variable doesn't matter, it can be replaced by an underscore
for _ in 1...5 {
    lyric += " hate"
}

print(lyric)



// using while loops

var countdown = 10
while countdown > 0 {
    print("\(countdown)…")
    countdown -= 1
}
print("Blast off!")

// create random numbers
let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

var roll = 0
while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll).")
}
print("Critical hit!")



// skipping loop items with break and continue

let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

// skipping the rest of one iteration with continue
for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(filename)")
}



let number1 = 4
let number2 = 14
var multiples = [Int]()

// exit the loop with break
for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)



/*
 summary
 - we can use if, else, and else if to check conditions
 - you can combine conditions using || (OR) and && (AND)
 - switch statements can be easier than using if and else if a lot, and Swift will check that they are exhaustive
 - the ternary conditional operator lets us check condition ? true : false
 - for loops let us loop over arrays, sets, dictionaries, and ranges
 - while loops create loops that continue running until a condition is false
 - we can skip loop items usimg continue or break respectively
 */


// checkpoint 3

for i in 1...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("FizzBuzz")
    } else if i.isMultiple(of: 3) {
        print ("Fizz")
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(i)
    }
}
