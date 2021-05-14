import UIKit

/*
 iOS Interview Questions and Foundation of iOS Development
 -------------------------------------------------------------------------------------------------------------------------------------------------------------
 */
//===========================================================================================================================================================

// MARK: - What is Swift?
/*
Swift is a general-purpose programming language built using a modern approach to safety, performance, and software design patterns.

 The goal of the Swift project is to create the best available language for uses ranging from systems programming, to mobile and desktop apps, scaling up to cloud services. Most importantly, Swift is designed to make writing and maintaining correct programs easier for the developer. To achieve this goal, we believe that the most obvious way to write Swift code must also be:

 - Safe. The most obvious way to write code should also behave in a safe manner. Undefined behavior is the enemy of safety, and developer mistakes should be caught before software is in production. Opting for safety sometimes means Swift will feel strict, but we believe that clarity saves time in the long run.

 - Fast. Swift is intended as a replacement for C-based languages (C, C++, and Objective-C). As such, Swift must be comparable to those languages in performance for most tasks. Performance must also be predictable and consistent, not just fast in short bursts that require clean-up later. There are lots of languages with novel features — being fast is rare.

 - Expressive. Swift benefits from decades of advancement in computer science to offer syntax that is a joy to use, with modern features developers expect. But Swift is never done. We will monitor language advancements and embrace what works, continually evolving to make Swift even better.

 Tools are a critical part of the Swift ecosystem. We strive to integrate well within a developer’s toolset, to build quickly, to present excellent diagnostics, and to enable interactive development experiences. Tools can make programming so much more powerful, like Swift-based playgrounds do in Xcode, or a web-based REPL can when working with Linux server-side code.
--------------------------------------------------------------------------------------------------------------------------------------------------------------
 Features
 Swift includes features that make code easier to read and write, while giving the developer the control needed in a true systems programming language. Swift supports inferred types to make code cleaner and less prone to mistakes, and modules eliminate headers and provide namespaces. Memory is managed automatically, and you don’t even need to type semi-colons. Swift also borrows from other languages, for instance named parameters brought forward from Objective-C are expressed in a clean syntax that makes APIs in Swift easy to read and maintain.

 The features of Swift are designed to work together to create a language that is powerful, yet fun to use. Some additional features of Swift include:
 - Closures unified with function pointers
 - Tuples and multiple return values
 - Generics
 - Fast and concise iteration over a range or collection
 - Structs that support methods, extensions, and protocols
 - Functional programming patterns, e.g., map and filter
 - Powerful error handling built-in
 - Advanced control flow with do, guard, defer, and repeat keywords

 -------------------------------------------------------------------------------------------------------------------------------------------------------------
 Safety
 Swift was designed from the outset to be safer than C-based languages, and eliminates entire classes of unsafe code. Variables are always initialized before use, arrays and integers are checked for overflow, and memory is managed automatically. Syntax is tuned to make it easy to define your intent — for example, simple three-character keywords define a variable (var) or constant (let).

 Another safety feature is that by default Swift objects can never be nil, and trying to make or use a nil object results in a compile-time error. This makes writing code much cleaner and safer, and prevents a common cause of runtime crashes. However, there are cases where nil is appropriate, and for these situations Swift has an innovative feature known as optionals. An optional may contain nil, but Swift syntax forces you to safely deal with it using ? to indicate to the compiler you understand the behavior and will handle it safely.

 https://swift.org/about/#swiftorg-and-open-source
 */
//===========================================================================================================================================================

// MARK: - What is type safety in swift?
/*
 Swift is a type-safe language, which means the language helps you to be clear about the types of values your code can work with. If part of your code requires a String, type safety prevents you from passing it an Int by mistake. Likewise, type safety prevents you from accidentally passing an optional String to a piece of code that requires a non-optional String. Type safety helps you catch and fix errors as early as possible in the development process.
 
 -------------------------------------------------------------------------------------------------------------------------------------------------------------
 Type Safety and Type Inference

 Swift is a type-safe language. A type safe language encourages you to be clear about the types of values your code can work with. If part of your code requires a String, you can’t pass it an Int by mistake.

 - Because Swift is type safe, it performs type checks when compiling your code and flags any mismatched types as errors. This enables you to catch and fix errors as early as possible in the development process.

 - Type-checking helps you avoid errors when you’re working with different types of values. However, this doesn’t mean that you have to specify the type of every constant and variable that you declare. If you don’t specify the type of value you need, Swift uses type inference to work out the appropriate type. Type inference enables a compiler to deduce the type of a particular expression automatically when it compiles your code, simply by examining the values you provide.

 Because of type inference, Swift requires far fewer type declarations than languages such as C or Objective-C. Constants and variables are still explicitly typed, but much of the work of specifying their type is done for you.

 Type inference is particularly useful when you declare a constant or variable with an initial value. This is often done by assigning a literal value (or literal) to the constant or variable at the point that you declare it. (A literal value is a value that appears directly in your source code, such as 42 and 3.14159 in the examples below.)
 
 let meaningOfLife = 42 // For example, if you assign a literal value of 42 to a new constant without saying what type it is, Swift infers that you want the constant to be an Int, because you have initialized it with a number that looks like an integer:
 https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html
 */
//===========================================================================================================================================================

// MARK: - What are retain cycles and memory leaks?
/*
 A memory leak in iOS is when an amount of allocated space in memory cannot be deallocated due to retain cycles. Since Swift uses Automatic Reference Counting (ARC), a retain cycle occurs when two or more objects hold strong references to each other. As a result these objects retain each other in memory because their retain count would never decrement to 0, which would prevent deinit from ever being called and memory from being freed.

-------------------------------------------------------------------------------------------------------------------------------------------------------------
 Why should we care about memory leaks?
 - Memory leaks increase the memory footprint incrementally in your app, and when it reaches a certain threshold the operating system (iOS) this triggers a memory warning. If that memory warning is not handled, your app would be force-killed, which is an OOM (Out of memory) crash. As you can see, memory leaks can be very problematic if a substantial leak occurs because after using your app for a period of time, the app would crash.

 - In addition, memory leaks can introduce side effects in your app. Typically this happens when observers are retained in memory when they should have been deallocated. These leaked observers would still listen to notifications and when triggered the app would be prone to unpredictable behaviors or crashes. In the next section we will go over an introduction to Xcode’s memory graph debugger and later use it find memory leaks in a sample app.
 
 https://doordash.engineering/2019/05/22/ios-memory-leaks-and-retain-cycle-detection-using-xcodes-memory-graph-debugger/
 -------------------------------------------------------------------------------------------------------------------------------------------------------------
 Leaks are dangerous
 Not only they increase the memory footprint of the app, but they also introduce unwanted side effects and crashes.
 Why does the memory footprint grow? It is a direct consequence of objects not being released. Those objects are actually garbage. As the actions that create those objects are repeated, the occupied memory will grow. Too much garbage! This can lead to memory warnings situations and in the end, the app will crash.
 -------------------------------------------------------------------------------------------------------------------------------------------------------------
 Retain Cycles
 The word retain comes from the Manual Reference Counting days in Objective-C. Before ARC and Swift and all the nice things we can do now with value types, there was Objective-C and MRC.
 - In Swift, when an object has a strong association to another object, it is retaining it. When I say object I am talking about Reference Types, Classes basically.
 - Struct and Enums are Value Types. It is not possible to create retain cycles with value types only. When capturing and storing value types (structs and enums), there is no such thing as references. Values are copied, rather than referenced, although values can hold references to objects.

 *** If A retains B and B retains A there is a retain cycle. ***
        A 👉 B + A 👈 B = 🌀
 
 Retain cycles are broken when one of the references in the cycle is weak or unowned. The cycle must exist because it is required by the nature of the associations we are coding. The problem is that all the associations cannot be strong. One of them must be weak.

 https://medium.com/flawless-app-stories/memory-leaks-in-swift-bfd5f95f3a74
*/
//===========================================================================================================================================================

// MARK: - Weak references and Unowned references in Swift
/*
 How to break retain cycles
 Swift provides two ways to resolve strong reference cycles when you work with properties of class type: weak references and unowned references.
 Weak and unowned references enable one instance in a reference cycle to refer to the other instance without keeping a strong hold on it. The instances can then refer to each other without creating a strong reference cycle.
 - Weak: A variable can optionally not take ownership of an object it references to. A weak reference is when a variable does not take ownership of an object.
    **** A weak reference can be nil. ****
 - Unowned: Like weak references, an unowned reference does not keep a strong hold on the instance it refers to. Unlike a weak reference, however, an unowned reference is assumed to always have a value. Because of this, an unowned reference is always defined as a non-optional type.
    **** An unowned reference cannot be nil. ****
 https://medium.com/flawless-app-stories/memory-leaks-in-swift-bfd5f95f3a74
 -------------------------------------------------------------------------------------------------------------------------------------------------------------
 
 Is using [weak self] always required when working with closures?
 - Using [weak self] is only required within situations in which capturing self strongly would end up causing a retain cycle, for example when self is being captured within a closure that’s also ultimately retained by that same object.
 - Using [weak self] can also be a good idea when working with closures that will be stored for a longer period of time, as capturing an object strongly within such a closure will cause it to remain in memory for that same amount of time.
 - In all other situations, using [weak self] is optional, but there’s typically no harm in adding it — unless we want to capture self strongly for some reason.
 https://www.swiftbysundell.com/questions/is-weak-self-always-required/
 -------------------------------------------------------------------------------------------------------------------------------------------------------------
 */
//===========================================================================================================================================================

// MARK: - Class vs Struct in Swift
/* What about the differences?
 The main difference between those two is that Classes are reference type, Structs are value type objects. Okay but what does it mean?
 Let’s talk about what they can offer in common.
 - They both define properties to store values. If we want to create an object with some properties and behaviors, we can use both of them.
 - Both of them define subscripts so we can reach their values via subscript syntax.
 - Classes and structs have initializers to create instances with initial values.
 - Conforming to protocols are also in common. Some protocols may be class only so only classes can conform to that protocol, otherwise both can conform it.
 - Finally, they can be extended.
 - Classes yet have some extra capabilities that structs don’t have.
 - They can inherit another classes characteristics.
 - A class can free up assigned resources by deinitializers.
 -------------------------------------------------------------------------------------------------------------------------------------------------------------
 When to use classes?
 - We need to use classes when we need Objective-C interoperability. If we use an Objective-C API that receives data from our side, those data must be a class because Objective-C doesn’t have structs.
 - Another use case for classes is when we need to control identity. If we need an instance of an object through the app and we want to control its identity, classes are the solution.
 -------------------------------------------------------------------------------------------------------------------------------------------------------------
 When to use structs?
 - Almost anytime. We must use structs by default to represent common kinds of data. Structs in Swift are powerful and have many features. They have stored properties, computed properties and methods. Also, they can conform to protocols and gain their behaviors. Many of types from Foundation and the Swift standard library are structs; for example strings, arrays, numbers and dictionaries.
 - Apart from classes, we should use structs when we don’t control identity. Think about fetching data from server, there may be same objects but since we are not controlling identity, we better use structs.
 https://medium.com/quick-code/class-vs-struct-in-swift-f8c48eaacdba
 */

// MARK: - Grand Central Dispatch with Swift
/*
 Computers can’t live without multithreading and concurrency. You know why? CPUs are kinda dumb – they can only do one thing at a time! You can use Grand Central Dispatch (GCD) with Swift to make your app execute multiple tasks concurrently. Grand Central Dispatch is paramount to keep your app responsive, with buttery smooth animations and transitions.
 -------------------------------------------------------------------------------------------------------------------------------------------------------------
 Multithreading and Concurrency
 - Here’s how you can execute a task asynchronously in Swift:
 
 DispatchQueue.global(qos: .userInitiated).async {
     // Download file or perform expensive task asynchronously
 }
 
 - But what exactly is “async”? To answer that question, we’ll need to discuss multithreading first.
 - An iPhone has a CPU, its Central Processing Unit. Technically, a CPU can only perform one operation at a time – once per clock cycle.
 **** Multithreading allows the processor to create concurrent threads it can switch between, so multiple tasks can be executed at the same time. ***
 
 - It appears as if the two threads are executed at the same time, because the processor switches rapidly between executing them. As a smartphone or desktop user, you don’t notice the switches because they occur so rapidly.
 **** Performing multiple tasks at the same time is called concurrency. ***
 
 A common example is the UI thread. Ever noticed how apps can still appear responsive and have smooth animations, even though the CPU is doing a lot of work? That’s because of multithreading.
 
 To summarize, multithreading allows a CPU to rapidly switch between multiple tasks in such a way that it appears as if the tasks are executed simultaneously.
 
 -------------------------------------------------------------------------------------------------------------------------------------------------------------
 Running Code in the Background
 - When coding apps multithreading is often used synonymously with background processing.
 - As an app developer, you want to keep your app responsive. Say you’re sending an update back to your cloud-based database, saving a note the user has stored in your app.
 - You don’t want the UI to freeze up when you’re saving this note, so you use background processing to do two things at the same time. Even though it really is multithreading, you’re calling it background processing because one task remains in the foreground (the UI) and one task is sent to the background (saving data).
 -------------------------------------------------------------------------------------------------------------------------------------------------------------
 Don’t Block The UI Thread!
 - You can’t update an app’s UI outside the main thread. User Interface operations, like showing a dialog or updating the text on a button can only be performed on the main thread. But… why?
 - There are a number of reasons for that, but the foremost reason is to avoid race conditions. A race condition occurs when two tasks are executed concurrently, when they should be executed sequentially in order to be done correctly. Conversely, some tasks should only be dispatched asynchronously to avoid a deadlock.
 - What if you execute a synchronous, blocking task on the main UI thread? The thread will wait until the synchronous task is executed. As a result, your apps UI may stutter, lag or become unresponsive for some time.

 We can derive a few first principles from this:
 - Keep the UI thread free, to keep your app responsive
 - Avoid blocking the UI thread with synchronous code
 - The good news is that we can do both with Grand Central Dispatch! We’ll move some task to the background, and then bring its result back onto the main thread to update the UI.
 -------------------------------------------------------------------------------------------------------------------------------------------------------------
 Executing Async Code with Grand Central Dispatch
 - When you need tasks executed concurrently, should you just go about creating a bunch of threads? Fortunately not! iOS has a terrific mechanism for working with concurrent tasks called Grand Central Dispatch.
 - The name “Grand Central Dispatch” is a reference to Grand Central Terminal in downtown New York. Imagine the CPU as a bunch of railroads, with the traincars as tasks being executed on those lines. A dispatcher is moving the cars along the railroads to ensure that they reach their destination quickly on a limited number of lines.
 - Grand Central Dispatch is a wrapper around low-level code, to create threads and manage code. Its emphasis is on dispatching, i.e. making sure that a number of tasks of variable importance and length are executed in a timeframe as reasonable as possible.

 - Let’s take a look at an example:
 DispatchQueue.global(qos: .userInitiated).async {
     // Download file or perform expensive task asynchronously
     DispatchQueue.main.async {
         // Update the UI
     }
 }
 
 - In the example above, an asynchonous task is dispatched with async(). The code that’s executed asynchronously is written in the first set of squiggly brackets { }. It’s a closure that’s executed in the background.

 https://learnappmaking.com/grand-central-dispatch-swift/
 -------------------------------------------------------------------------------------------------------------------------------------------------------------
 */
//===========================================================================================================================================================
