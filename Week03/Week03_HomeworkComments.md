Mobile App Development Week 03 Homework Notes

Part 1 — Learning Swift

Days 12-14

Day 12: It wasn’t too bad, had a little more difficulty with the checkpoint but for the most part it was okay.
Main concepts:
- Classes can inherit from other classes, so they get access to the properties and methods of their parent
- Child classes can override functions of their parent classes
- Swift does not generate a memberwise initializer for classes, however child classes can inherit the initializers of their parent classes
- Copies of a class instance point to the same instance
- Classes will automatically call deinitializers when the last copy of an instance is destroyed
- Variable properties can be changed inside a constant class instance

Day 13: Going through the tutorials was okay, I’m still not super confident in using protocols and extensions but I think that will remedy itself over time.
Main concepts:
- Protocols specify methods and properties that are required, and conforming types must implement them
- Opaque return types let us hide some information in our code, which helps to maintain flexibility in the code for the future
- Extensions add functionality to existing types
- Protocol extensions let us add functionality to many types all at once (e.g. Collection)

Day 14: Optionals took me longer to understand but I was able to get through this day without too much difficulty. I think I mainly just need to practice writing optionals more.
Main concepts:
- if let runs code if the optional has a value; guard let runs code if the optional doesn't have a value
- ?? unwraps and returns an optional's value, or a default value instead
- Optional chaining reads an optional inside another optional
- try? can convert throwing functions so they return an optional



Part 2 — Create a single view SwiftUI app

Based on the Canvas-Explore example, I created a single view app that creates random dot art of 100 dots at a time. I mainly studied the example code and used Xcode’s Quick Help and Developer Documentation features to learn about the different structs and functions like Canvas and Path and their respective functions. The hardest part was figuring out how to make a circle with the Canvas and Path structs, but Apple’s Developer Documentation helped a lot with that.