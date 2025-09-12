import Cocoa

var greeting = "Hello, playground"

// DAY 2

// booleans

let filename1 = "paris.jpg"
print(filename1.hasSuffix(".jpg"))

let number3 = 120
print(number3.isMultiple(of: 3))

let goodDogs = true
var gameOver = false
print(gameOver)
gameOver.toggle() // also interchanges true and false
print(gameOver)

let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

// joining strings together

let quote1 = "Then he tapped a sign saying \"Believe\" and walked away."

let firstPart = "Hello, "
let secondPart = "world!"
let greeting1 = firstPart + secondPart

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action

let luggageCode = "1" + "2" + "3" + "4" + "5"

let name2 = "Taylor"
let age = 26
let message = "Hello, my name is \(name2) and I'm \(age) years old" // string interpolation
// allows you to also join ints and strings together withoout having to wrap them
print(message)

let number4 = 11
let missionMessage = "Apollo \(number4) landed on the moon"

print("5 x 5 is \(5 * 5)")

/*
summary
 - swift lets us create constants using let, and variables using var
 - swift's strings contain text, from short strings up to whole novels
 - you create strings by using double quotes at the start and end
 - swift calls its whole numbers integers, or int
 - in swift, decimal numbers are called Double (whcih are not 100% accurate
 - can store a simple true or false using a Boolean, or Bool
 - string interpolation lets us place data into strings efficiently
*/

// checkpoint 1

let temperatureC = 0.0
let temperatureF = (temperatureC * 9.0 / 5.0) + 32.0
print("The temperature is \(temperatureC)°C or \(temperatureF)°F")

