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

// MARK: - What are difference between UITableViewDelegate and UITableViewDatasource?
/*
 UITableViewDelegate
- Serving as a table's delegate means you provide answers to requests about the layout of the table and about actions the user performs on the tableview. Layout methods include the tableview asking about the height of rows, headers, and footers, what the buttons should look like, etc. Action methods include the user selecting a row and beginning and ending the editing of a row.
 
 UITableViewDatasource
- Serving as a table's datasource means you provide data for the sections and rows of a table and you act on messages that change a table's data. The datasource is asked for the data for a cell when the table is drawn, is told that the user has asked to delete a row, and is told the new value of a row that the user has edited.

 -------------------------------------------------------------------------------------------------------------------------------------------------------------
 What is a UITableView delegate?
 - The delegate of an UITableView object must adopt the UITableViewDelegate protocol. Optional methods of the protocol allow the delegate to manage selections, configure section headings and footers, help to delete and reorder cells, and perform other actions.
 
 What is UITableViewDataSource?
 - UITableViewDataSource is a protocol you implement to provide data for your UITableView . ... With UITableViewDataSource protocol you will be able to feed data into your table. Messages defined on this protocol will be called automatically by the UITableView class.

 https://stackoverflow.com/questions/5714528/difference-between-uitableviewdelegate-and-uitableviewdatasource
 */
//===========================================================================================================================================================

// MARK: - CoreData and Concurrency
/*
 *** Concurrency ***
 - Concurrency is the ability to work with the data on more than one queue at the same time. If you choose to use concurrency with Core Data, you also need to consider the application environment. For the most part, AppKit and UIKit are not thread-safe. In macOS in particular, Cocoa bindings and controllers are not threadsafe—if you are using these technologies, multithreading may be complex.

 *** Core Data, Multithreading, and the Main Thread  ***
 - In Core Data, the managed object context can be used with two concurrency patterns, defined by NSMainQueueConcurrencyType and NSPrivateQueueConcurrencyType.
 - NSMainQueueConcurrencyType is specifically for use with your application interface and can only be used on the main queue of an application.
 - The NSPrivateQueueConcurrencyType configuration creates its own queue upon initialization and can be used only on that queue. Because the queue is private and internal to the NSManagedObjectContext instance, it can only be accessed through the performBlock: and the performBlockAndWait: methods.
 - In both cases, the initialization of the NSManagedObjectContext instance is the same:
 - The parameter being passed in as part of the initialization determines what type of NSManagedObjectContext is returned.
 - When you are using an NSPersistentContainer, the viewContext property is configured as a NSMainQueueConcurrencyType context and the contexts associated with performBackgroundTask: and newBackgroundContext are configured as NSPrivateQueueConcurrencyType.

 *** Using a Private Queue to Support Concurrency  ***
 - In general, avoid doing data processing on the main queue that is not user-related. Data processing can be CPU-intensive, and if it is performed on the main queue, it can result in unresponsiveness in the user interface. If your application will be processing data, such as importing data into Core Data from JSON, create a private queue context and perform the import on the private context. The following example shows how to do this:
 
 let jsonArray = … //JSON data to be imported into Core Data
 let moc = … //Our primary context on the main queue
 let privateMOC = NSManagedObjectContext(concurrencyType: .PrivateQueueConcurrencyType)
 privateMOC.parentContext = moc
 privateMOC.performBlock {
     for jsonObject in jsonArray {
         let mo = … //Managed object that matches the incoming JSON structure
         //update MO with data from the dictionary
     }
     do {
         try privateMOC.save()
         moc.performBlockAndWait {
             do {
                 try moc.save()
             } catch {
                 fatalError("Failure to save context: \(error)")
             }
         }
     } catch {
         fatalError("Failure to save context: \(error)")
     }
 }
 - In this example an array of data has been originally received as a JSON payload. You then create a new NSManagedObjectContext that is defined as a private queue. The new context is set as a child of the main queue context that runs the application. From there you call performBlock: and do the actual NSManagedObject creation inside of the block that is passed to performBlock:. After all of the data has been consumed and turned into NSManagedObject instances, you call save on the private context, which moves all of the changes into the main queue context without blocking the main queue.

 This example can be further simplified when using an NSPersistentContainer:

 let jsonArray = …
 let container = self.persistentContainer
 container.performBackgroundTask() { (context) in
     for jsonObject in jsonArray {
         let mo = EmployeeMO(context: context)
         mo.populateFromJSON(jsonObject)
     }
     do {
         try context.save()
     } catch {
         fatalError("Failure to save context: \(error)")
     }
 }
 - Passing References Between Queues
 - NSManagedObject instances are not intended to be passed between queues. Doing so can result in corruption of the data and termination of the application. When it is necessary to hand off a managed object reference from one queue to another, it must be done through NSManagedObjectID instances.
- You retrieve the managed object ID of a managed object by calling the objectID method on the NSManagedObject instance.
 -------------------------------------------------------------------------------------------------------------------------------------------------------------
 Is Core Data Thread Safe
 - Is Core Data thread safe? Yes and no. Even though the framework originated in a time where computers with multicore processors were rare, Core Data is designed to operate in a multithreaded environment. In other words, it works fine on the latest iPhone and a Mac Pro with 28 cores.
 - But you need to know the rules Core Data plays by. A managed object context is always bound to a dispatch queue, a queue for short. The same applies to managed objects. You should never pass a managed object from one queue to another. If you need to access a managed object from another queue, then pass the ID of the managed object, an instance of the NSManagedObjectID class. A NSManagedObjectID instance uniquely identifies a record in the persistent store. Working In a Multithreaded Environment covers Core Data and threading in more detail.
 https://cocoacasts.com/is-core-data-thread-safe
 https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/Concurrency.html
 */
//===========================================================================================================================================================

// MARK: -  Thread Safe
/*
 Thread Unsafe - If any object is allowed to modify by more than one thread at the same time.
 Thread Safe - If any object is not allowed to modify by more than one thread at the same time.

 - Generally, immutable objects are thread-safe.
 -------------------------------------------------------------------------------------------------------------------------------------------------------------
 Working In Thread Safe on iOS
 - As you might know, the word “Thread safe” is referred to a computer science concept in the context of multi-thread programs. A code is called “Thread safe” if any shared data is accessed by only one thread at any given time. Notice these shared data are called critical sections in an operating system.
 - The point is Swift collection types like Array and Dictionary are not thread-safe when declared mutable (With var keyword).
 In this post, we will discuss some techniques to make our code thread safe in iOS.
 
 Solutions
 - The way to avoid race conditions is to synchronize data, or the critical sections. Synchronizing data usually means to “lock” it so that only one thread can access that part of the code at a time.
 - Since Swift does not support built-in concurrency solutions, we’re going to use Grand Central Dispatch to implement thread safe instead.

 Using serial queue
 - By leveraging serial queues, we can prevent race conditions on a resource. As I introduced how a serial queue works in a previous post, Grand-Central-Dispatch-in-Swift, a serial queue allows just only one process run at a time so the array is safe from concurrent processes.
 - Although we protect the array from being accessed by multiple threads, using serial queue is not the best solution. Reading the last value is not optimized because multiple read requests have to wait for each other as it is in a serial queue. Reads should be able to happen concurrently, as long as we do not make a write at the same time.

 Using concurrent queue with the barrier flag
 - The main idea of this solution is using a concurrent queue instead of a serial queue.
 - Swift supports us to dispatch a block of code to a concurrent queue with a flag called barrier. The barrier flag ensures that the concurrent queue does not execute any other tasks while executing the barrier process. Once the barrier process done, then the queue allows running other tasks simultaneously by default implementation.
 
 The trade off
 - Working with multiple threads is a hard part of coding. Although we have to protect critical sections from multiple accesses, we should keep in mind that *”Keep the synchronized sections as small as possible because Locks create delays and add overhead. They are expensive”*. Clean code.
 
 Some tips to deal with concurrency:
 - Concurrency does not always improve performance. It sometimes incurs some overhead and bugs come from it are not usually repeatable.
 - Limit the access of the data that is shared between more than two threads. Use copies of data if there is a chance.
 Multithreaded code behaves differently in different environments: Run tests in every potential deployment environment.
 
 Final thoughts
 - Thread safe is one of the most important concepts in computer science, especially in a system which allows accessing data simultaneously. Understand how to make code thread safe, we can avoid serious errors occurring at runtime.
 https://uynguyen.github.io/2018/06/05/Working-In-Thread-Safe-on-iOS/
 https://stackoverflow.com/questions/41400185/what-does-it-mean-for-something-to-be-thread-safe-in-ios
 */
//===========================================================================================================================================================

// MARK: - The iOS Application Lifecycle
/*
 
 Application Life Cycle is very important to understand for all the iOS Developers, who want to make enriched , immersive and smooth User experience.
 - How the application starts :
 When The User just turned on his phone, no applications are running except those that are belong to the operating system. Your Application is not running. After the User taps your app icon, Springboard the part of the OS, that operates the home screen of iOS, launches your app. Your app and the shared libraries it needs to execute, will be loaded into the memory, while springboard animates your app’s launch screen. eventually your app begins execution and application delegate receives the notifications.
 ***Every iOS application, on the device will be transitioned to several states like***
 - Not Running
 - In Active
 - Active
 - Background and Suspended states.
 
 ***At any given moment, your app fells into one of the above states.***
 - The iOS operating system manages the application states, but the app is responsible for handling user-experience through these state transitions.
   - Not Running — Either the application has not started yet or was running and has been terminated by the system.
   - Inactive — An application is running in the Foreground but is not receiving any events. This could happen in case a Call or Message is received. An application could also stay in this state while in transition to a different state. In this State, we can not interact with app’s UI.
   - Active — An application is running in the Foreground and receiving the events. This is the normal mode for the Foreground apps. The only way to go to or from the Active state is through the Inactive state. User normally interacts with UI, and can see the response/result for user actions.
   - Background — An application is running in the background and executing the code. Freshly launching apps directly enter into In-Active state and then to Active state. Apps that are suspended, will come back to this background state, and then transition to In-Active → Active states. In addition, an application being launched directly into the background enters this state instead of the inactive state.
   - Suspended — An application is in the background but is not executing the code. The system moves the application to this state automatically and does not notify. In case of low memory, the system may purge suspended application without notice to make free space for the foreground application. Usually after 5 secs spent in the background, apps will transition to Suspend state, but we can extend the time if app needs.
 
 ***UIApplication object defines some methods which are called or will be responded to some of the above states which are most important, to let us work on those transition states regarding our app functionalities. Let us see in the following.***
 
 ***As soon as application has successfully initiated launch process :***
 - application:willFinishLaunchingWithOptions — This method is called after your application has been launched successfully. It is the first method from our app delegate , which will be called. You can execute your code if the launch was successful.
 - application:didFinishLaunchingWithOptions — This method is called before the app’s window is displayed. You can finalise your interface and can provide the root ViewController to the window.
 - applicationDidBecomeActive — This method is either called to let your app know that it moved from the inactive to active state or your app was launched by the user or the system or in case user ignores an interruption (such as an incoming phone call or SMS message) that sent the application temporarily to the inactive state. You should use this method to restart any tasks that were paused (or not yet started) while the app was inactive.
 - applicationWillResignActive — This method is called to let your app know that it is about to move from active to inactive state. This can happen in case of any interruptions (such as an incoming phone call or SMS message or Calendar alerts) or when the user quits the app. You should use this method to pause any ongoing tasks or disable timers etc.
 - applicationDidEnterBackground — This method is called to let app know that it is not running in the foreground. You have approximately five seconds to perform any tasks and return back. In case you need additional time, you can request additional execution time from the system by calling beginBackgroundTask(expirationHandler:). If the method does not return before time runs out your app is terminated and purged from memory.
 - applicationWillEnterForeground — This method is called as a part of the transition from the background to the active state. You should use this to undo any change you made to your app upon entering the background. applicationDidBecomeActive method is called soon after this method has finished its execution which then moves the app from the inactive to the active state.
 - applicationWillTerminate — This method is called to let you know that your app is about to terminate. You should use this method to perform any final clean-up task. You have approximately five seconds to perform any tasks and return back. If the method does not return before time expires, the system may kill the process altogether. This method may be called in situations where the app is running in the background (not suspended) and the system needs to terminate it for some reason. You shouldn’t wait applicationWillTerminate to be called in order to save your data. There are some cases when applicationWillTerminate won’t be called before app termination. For example the system will not call applicationWillTerminate when the device reboots.
 -------------------------------------------------------------------------------------------------------------------------------------------------------------
 What is AppDelegate life cycle in Swift?
Like the UIApplication object, UIKit creates your app delegate object early in your app's launch cycle so it is always present. Use your app delegate object to handle the following tasks: Initializing your app's central data structures. Configuring your app's scenes.
 https://hackernoon.com/application-life-cycle-in-ios-12b6ba6af78b
 */
//===========================================================================================================================================================



