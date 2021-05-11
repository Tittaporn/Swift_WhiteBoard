import UIKit

//Challenge 4: Does one string contain another?
//Swift Coding Challenges By Paul Hudson

/*
 Write your own version of the contains() method on String that ignores letter case, and without using the existing contains() method.

 Sample input and output
 • The code "Hello, world".fuzzyContains("Hello") should return true.
 • The code "Hello, world".fuzzyContains("WORLD") should return true. • The code "Hello, world".fuzzyContains("Goodbye") should return false.
 */

extension String {
    func fuzzyContain(word: String) -> Bool {
        return self.lowercased().range(of: word.lowercased()) != nil
    }
}

let helloWorld = "Hello World"
helloWorld.fuzzyContain(word: "LO")

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 If you were already familiar with the range(of:) method, this one should have proved straightforward. If not, you were probably wondering why I gave it an easy grade!
 The range(of:) method returns the position of one string inside another. As it’s possible the
 substring might not exist in the other, the return value is optional. This is perfect for us: if we call range(of:) and get back nil, it means the substring isn’t contained inside the check string.
 Ignoring letter case adds a little complexity, but can be solved either by collapsing the case before you do your check, or by using the .caseInsensitive option for range(of:).
 The former looks like this:
 */
 extension String {
 func fuzzyContains(_ string: String) -> Bool {
 return self.uppercased().range(of: string.uppercased()) != nil
 } }

// And the latter like this:
 extension String {
 func fuzzyContainsByPualHudson(_ string: String) -> Bool {
 return range(of: string, options: .caseInsensitive) != nil
 } }
// In this instance the two are identical, but there’s a benefit to collapsing the case if you had to check through lots of items.

