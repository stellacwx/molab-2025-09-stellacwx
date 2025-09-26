import Cocoa

var greeting = "Hello, playground"

// DAY 12

// classes

// creating classes

/*
 structs vs. classes
 similarities:
 - can create and name them
 - add properties, methods, property observers, and access controls
 - create custom initializers to configure new instances
 differences:
 - one class can build upon functionality from another class (inheritance)
 - swift won't generate a memberwise initializer for classes
 - all copies of an instance of a class share the same data
 - can add a deinitializer to run when the final copy is destroyed
 - constant class instances can have their variable properties changed
 */

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10



// inheriting classes

class Employee {
    let hours: Int
    init(hours: Int) {
        self.hours = hours
    }
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

// class name: parent class name
class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    // must use override keyword to override a function -- for safety
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

// final keywword means the class can inherit from other things but other classes cannot inherit from it (can only be a child class)
final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()



// adding initializers for classes

// if a child class has custom initializers, it must always call the parent's initializer after it has finished setting up its own properties
class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

// if a child class does not have its own initializer (but has default variables) then it will automatically inherit the initializer from the parent class



// copying classes

// classes are reference types

class User {
    var username = "Anonymous"
}

var user1 = User()

var user2 = user1
user2.username = "Taylor"

// refers to the same data
print(user1.username)
print(user2.username)

// create a unique copy (aka deep copy) of a class instance so that changes won't impact the original
class User2 {
    var username = "Anonymous"

    func copy() -> User2 {
        let user = User2()
        user.username = username
        return user
    }
}



// creating a deinitializer for a class

// called when an object is destroyed
/*
 - dont use func
 - never take parameters -- no parentheses
 - will be automatically called when the last copy of a class instance is destroyed
 - we never call deinitializers directly
 - structs don't have deinitializers
 */

class User3 {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

// user created inside a loop will be destroyed once the loop ends
for i in 1...3 {
    let user = User3(id: i)
    print("User \(user.id): I'm in control!")
}

var users = [User3]()

for i in 1...3 {
    let user = User3(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")



// working with variables inside classes

class User4 {
    var name = "Paul"
}

// can change the variable properties within a constant
let user = User4()
user.name = "Taylor"
print(user.name)

class User5 {
    var name = "Paul"
}

var user3 = User5()
user3.name = "Taylor"
user3 = User5()
print(user.name)

/*
 4 possible situations:
 1. constant class, constant property
 2. constant class, variable property
 3. variable class, constant property
 4. variable class, variable property
 */

// constant structs cannot have their properties changed even if the properties inside are variable -- structs hold all their data inside while classes refer to something else

// classes don't need to have mutating keyword for methods that change the function



/* summary
 - classes have lots of things in common with structs
 - classes can inherit from other classes, so they get access to the properties and methods of their parent
 - swift does not generate a memberwise initializer for classes
 - copies of a class instance point to the same instance
 - classes run deinitializers when the last copy of an instance is destroyed
 - you can change variable properties inside constant class instances
 */



// checkpoint 7

/*
 make a class hierarchy for animals
 - start with Animal with a legs property
 - make a Dog subclass with a speak() method, but each subclass should print something different
 - make Corgi and Poodle subclasses of Dog
 - make Cat an Animal subclass. add a speak() method, with each subclass printing something different, and an isTame Boolean, set with an initializer
 - make Persian and Lion as subclasses of Cat
 */

class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    init() {
        super.init(legs: 4)
    }
    func speak() {
        print("Woof!")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Bark!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Yip!")
    }
}

class Cat: Animal {
    var isTame: Bool = false
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
    func speak() {
        print("Meow!")
    }
}

class Persian: Cat {
    override func speak() {
        print("Growl!")
    }
}

class Lion: Cat {
    override func speak() {
        print("Roar!")
    }
}

var corgi = Corgi()
corgi.speak()

var cat = Cat(isTame: true)
cat.speak()

var persian = Persian(isTame: false)
persian.speak()
