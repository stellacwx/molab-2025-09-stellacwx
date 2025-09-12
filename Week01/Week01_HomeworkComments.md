Mobile App Development Week 01 Homework Notes

Part 1 — Learning Swift

I decided to use the 100 days of swift tutorials

Day 1: I think having Java experience helps with grasping how swift works, certain concepts are very similar, finished day 1 with no issues
Main concepts:
- Cannot add ints and doubles together (type safety)
- Once a variable is created, its type cannot be changed
- Swift lets us use doubles and cgfloats interchangeably 

Day 2: I was already familiar with the concepts of booleans so that part was easy but string interpolation was interesting. I was able to complete the checkpoint easily and without any issues or hints.
Main concepts:
- .toggle() interchanges true/false
- Strings can be concatenated with +
- \(variable) allows you to insert variables into string — string interpolation

Day 3: Still pretty smooth-sailing, messed up a little in the test for dictionaries, but I think I still grasped the concepts pretty quickly
Main concepts:
- [], Array<Type>(), or [Type]() to initialize array
- Dictionaries have keys and values initialized as [key : value]
- Sets will automatically remove duplicate values and won't remember the exact order used in the array
- An enum is a set of named values we can create and use in our code

Day 4: Also pretty simple, was able to complete the checkpoint without any issues and without using the hints.
Main concepts:
- Type annotations: let/var variableName: Type = _____
- Type annotations are useful when trying to force a particular type

Day 5: Switch statements and ternary operators were interesting concepts and more different from what I was familiar with, but still understandable and easy to learn.
Main concepts: 
- If statements
- Check multiple conditions with && and ||
- Switch statements can be more efficient and are exhaustive which leaves less room for errors
- Ternary conditional operator: condition ? If true : else

Day 6: Familiar with loops so these lessons were pretty quick to go through. The checkpoint was also not too hard to complete.
Main concepts:
- For-loop: for n in array { }
- Looping over fixed range of numbers: for i in 1…x { }
- When the loop variable doesn't matter, it can be replaced by an underscore
- Skip loop iterations with continue, exit loop with break

Day 7: Definitely harder than the previous days, I think being able to return multiple items from a function was a new concept, but I still got the hang of it quick enough
Main concepts:
- Functions: func functionName() { }
- Function that returns something: func functionName() -> (var: Type) 
- Tuples return multiple variables: func functionName() -> (var: Type, var: Type)
- Parameter labels: can have different functions that have the same name but with different parameter names
- Can have external and internal parameter labels



Part 2 — Creating a playground that produces text art
Following the example in the homework assignment, I created one playground that generates a random 5x5 text art using color blocks with code that made more sense to me. I also created a function that generates a sunset using the same blocks. For both, I first tried to fit everything into their respective functions, but I found making helper functions made the code shorter and easier to navigate. I created one helper function that generates a random color block, and then one helper function that generates a solid line of color. Lastly, using the same generateSolidColorLine function, I created a function that generates a rainbow whose length depends on what is passed into the function. Creating the functions was very manageable once I created the helper functions. One issue is that I don’t know if there would be a more consistent way to write the code, since the first function pulls the colors from an array of Strings while the other two just create the color as a String within the function. However, I had no issues with the code not running or any bugs. 