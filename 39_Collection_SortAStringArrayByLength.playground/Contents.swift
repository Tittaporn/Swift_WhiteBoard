import UIKit

//Challenge 39: Sort a string array by length
//Swift Coding Challenges By Paul Hudson

/*
 Extend collections with a function that returns an array of strings sorted by their lengths,
 longest first.
 
 Sample input and output
 • The code ["a", "abc", "ab"].challenge39() should return ["abc", "ab", "a"].
 • The code ["paul", "taylor", "adele"].challenge39() should return ["taylor", "adele","paul"].
 • The code [String]().challenge39() should return [].
 Hint #1: You’ll need to extend the Collection type with a specific constraint rather than a protocol constraint.
 Hint #2: You should use the built-in sorted() method.
 Hint #3: You can provide a custom closure to sorted() to affect how it works.
 
 */

extension Collection where Iterator.Element == String {
    func sortStringByLength() -> [String] {
        return self.sorted {$0.count > $1.count}
    }
}

let test0 = ["a", "abc", "ab"].sortStringByLength()
let test1 = ["paul", "taylor", "adele"].sortStringByLength()
let test2 = [String]().sortStringByLength()


//==============================================================================================================================
//Solution by By Paul Hudson
/*
 This is a simple test that requires you to understand protocol extensions as well as using closures with built-in methods. There’s also some scope to discuss reverse sorting – there is a built-in reversed() method, but if you’re writing a custom closure anyway you might as well just flip the operator from < to >.
 
 All in, it takes just one line of code to solve, as long as you embed that line inside the right method and extension definitions:
 */

extension Collection where Iterator.Element == String {
    func challenge39() -> [String] {
        return self.sorted { $0.count > $1.count }
    }
}
