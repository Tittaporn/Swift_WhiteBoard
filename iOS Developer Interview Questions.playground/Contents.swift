import UIKit

/* iOS Interview Question 
 retain cycles and weak self
 class vs struct
 
 https://www.swiftbysundell.com/questions/is-weak-self-always-required/
 Is using [weak self] always required when working with closures?
 
 Using [weak self] is only required within situations in which capturing self strongly would end up causing a retain cycle, for example when self is being captured within a closure that’s also ultimately retained by that same object.
 Using [weak self] can also be a good idea when working with closures that will be stored for a longer period of time, as capturing an object strongly within such a closure will cause it to remain in memory for that same amount of time.
 In all other situations, using [weak self] is optional, but there’s typically no harm in adding it — unless we want to capture self strongly for some reason.
 
 
 ==========================================================
 Class vs Struct in Swift
 So, what about the differences?
 The main difference between those two is that Classes are reference type, Structs are value type objects. Okay but what does it mean?
 https://medium.com/quick-code/class-vs-struct-in-swift-f8c48eaacdba
 Let’s talk about what they can offer in common.
 They both define properties to store values. If we want to create an object with some properties and behaviors, we can use both of them.
 Both of them define subscripts so we can reach their values via subscript syntax.
 Classes and structs have initializers to create instances with initial values.
 Conforming to protocols are also in common. Some protocols may be class only so only classes can conform to that protocol, otherwise both can conform it.
 Finally, they can be extended.
 Classes yet have some extra capabilities that structs don’t have.
 They can inherit another classes characteristics.
 A class can free up assigned resources by deinitializers.
 
 When to use classes?
 We need to use classes when we need Objective-C interoperability. If we use an Objective-C API that receives data from our side, those data must be a class because Objective-C doesn’t have structs.
 Another use case for classes is when we need to control identity. If we need an instance of an object through the app and we want to control its identity, classes are the solution.
 When to use structs?
 Almost anytime. We must use structs by default to represent common kinds of data. Structs in Swift are powerful and have many features. They have stored properties, computed properties and methods. Also, they can conform to protocols and gain their behaviors. Many of types from Foundation and the Swift standard library are structs; for example strings, arrays, numbers and dictionaries.
 Apart from classes, we should use structs when we don’t control identity. Think about fetching data from server, there may be same objects but since we are not controlling identity, we better use structs.
 
 
 ///Memory leak
 
 A memory leak in iOS is when an amount of allocated space in memory cannot be deallocated due to retain cycles. Since Swift uses Automatic Reference Counting (ARC), a retain cycle occurs when two or more objects hold strong references to each other.
 
 https://doordash.engineering/2019/05/22/ios-memory-leaks-and-retain-cycle-detection-using-xcodes-memory-graph-debugger/
 */
