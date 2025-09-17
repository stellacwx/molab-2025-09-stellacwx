Mobile App Development Week 02 Homework Notes

Part 1 — Learning Swift

Finished Days 1-7 last week so I’m starting on Day 8

I spent about 6 hours

Day 8: I think Day 8 wasn’t too bad, I was able to get through the lessons, quizzes, and checkpoints without issue.
Main concepts:
- Provide default values for parameters by adding = [defaultValue] after the type
- Three steps to handling an error:
    - (1) tell Swift about the possible errors that can happen 
    - (2) write a function that can flag up errors if they happen 
    - (3) call that function and handle any errors that might happen
- Use throws keyword to handle errors
- Must always have a catch block that handles every kind of error, but can create additional ones that catch specific errors

Day 9: Closures are a very new concept for me so these lessons took me longer. I think I still need to practice more to understand trailing closures and remembers all the syntax. I was able to complete the checkpoint, but it was definitely harder than previous ones.
Main concepts:
- Closure: assign a functionality directly to a constant/variable
- Closure parameters and return value are declared inside their braces followed by keyword in
- Type annotation for function that returns nothing
    - var greetCopy: () -> Void = greetUser
- Can pass functions into functions
- $0, $1, $… are shorthand for parameter arguments

Day 10: Structs were an interesting concept but much easier to understand than closures were.
Main concepts: 
- Structs help make a custom type
    - Must start with capital
- Mutating funds in structs must have mutations keyword
- Structs have two kinds of properties, stored properties and computed properties
- willSet executes right before and didSet executes right after
- oldValue and newValue are built into Swift
- Can call other methods of your struct inside your initializer, you can’t do so before assigning values to all your properties
- Memberwise initializer will be gone once custom initializers are created unless extra steps are taken to maintain it

Day 11: I think Day 11 was pretty easy as well, similar concepts as what I’ve learned in other languages which made it easier to grasp.
Main concepts:
- Use private keyword to limit access control
- Swift cannot generate memberwise initializer for private properties — must be done manually
- Cannot reference regular properties/methods from static properties/methods, but can do the other way around



Part 2 — Image Playground

I chose to try the UI image render, following UIRender’s render fill playground. I created a 1024 x 1024 sunset using UIColor’s built-in colors. First, I laid down the base colors of the sunset, then created a function that creates a bit of blending for a smoother transition between colors. Then, I added the sun and created another function to create some of the details of the sun’s reflection on the ocean. I think this was a fun playground to try out, definitely took some time to figure out the order of what I should render first to make it easiest to code. I think it can be improved on efficiency and in the future I can try to make the sunset even more details, but I think it turned out well.