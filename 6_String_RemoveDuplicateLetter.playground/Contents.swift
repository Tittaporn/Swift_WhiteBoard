import UIKit

//Challenge 6: Remove duplicate letters from a string
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that accepts a string as its input, and returns the same string just with
 duplicate letters removed.
 Tip: If you can solve this challenge without a for-in loop, you can consider it “tricky” rather than “easy”.

 Sample input and output
 • The string “wombat” should print “wombat”.
 • The string “hello” should print “helo”.
 • The string “Mississippi” should print “Misp”.
 */

func removeDuplicateLettersFrom(_ string: String) -> String {
    var newString = ""
    for letter in string {
        if !newString.contains(letter) {
            newString += String(letter)
        }
    }
    return newString
}

func removeDuplicateLettersWithoutForLoopFrom(_ string: String) -> String {
    let arrayString = string.map {String($0)}
    let setOfString = NSOrderedSet(array: arrayString)
    let letters = Array(setOfString) as! Array<String>
    let newString = letters.joined()
    return newString
}

func removeDuplicateLetterWithUpdateValue(_ string: String) -> String {
    var dict = [Character: Bool]()
    let filterString = string.filter {dict.updateValue(true, forKey: $0) == nil}
    return filterString
}

removeDuplicateLettersFrom("wombat")
removeDuplicateLettersFrom("Mississippi")
removeDuplicateLettersFrom("Hello")
removeDuplicateLettersWithoutForLoopFrom("wombat")
removeDuplicateLettersWithoutForLoopFrom("Mississippi")
removeDuplicateLettersWithoutForLoopFrom("Hello")
removeDuplicateLetterWithUpdateValue("wombat")
removeDuplicateLetterWithUpdateValue("Mississippi")
removeDuplicateLetterWithUpdateValue("Hello")

//==============================================================================================================================
//Solution by By Paul Hudson
/*
 There are three interesting ways this can be solved, and I’m going to present you with all three so you can see which suits you best. Remember: “fastest” isn’t always “best”, not least because readability is important, but also particularly because “memorizability” is important too – the perfect solution is often easily forgotten when you’re being tested.
 Let’s look at a simple but interesting solution first: using sets. Swift’s standard library has a built-in Set type, but it does not preserve the order of its elements. This is a shame, because otherwise the solution would have been as simple as this:
 */

let string = "wombat"
let set = Set(string)
print(String(set))
 
/*
 However, Foundation has a specialized set type called NSOrderedSet. This also removes duplicates, but now ensures items stay in the order they were added. Sadly, it’s not bridged to Swift in any pleasing way, which means to use it you must add typecasting: once from Character to String before creating the set, then once from Array<Any> to Array<String>. This function does just that:
 */

 func challenge6a(string: String) -> String {
    let array = string.map { String($0) }
    let set = NSOrderedSet(array: array)
    let letters = Array(set) as! Array<String>
    return letters.joined()
 }

/* That passes all tests, but I think you’ll agree it’s a bit ugly. I suspect Swift might see a native OrderedSet type in the future.
 A second solution is to take a brute-force approach: create an array of used characters, then loop through every letter in the string and check if it’s already in the used array. If it isn’t, add it, then finally return a stringified form of the used array. This is nice and easy to write, as long as you know that you can create a String directly from a Character array:
 */
 
func challenge6b(string: String) -> String {
    var used = [Character]()
    for letter in string {
        if !used.contains(letter) {
            used.append(letter) }
    }
    return String(used)
 }
 
 /*
 There is a third solution, and I think it’s guaranteed to generate some interesting discussion in an interview or book group!
 As you know, dictionaries hold a value attached to a key, and only one value can be attached to a specific key at any time. You can change the value attached to a key just by assigning it again, but you can also call the updateValue() method – it does the same thing, but also returns either the original value or nil if there wasn’t one. So, if you call updateValue() and get back nil it means “that wasn’t already in the dictionary, but it is now.” We can use this method in combination with the filter() method on our input string’s character property: filter the characters so that only those that return nil for updateValue() are used in the return array. So, the third solution to this challenge looks like this:
 */

 func challenge6c(string: String) -> String {
    var used = [Character: Bool]()
    let result = string.filter { used.updateValue(true, forKey: $0) == nil}
    return String(result)
 }
 
/*
 As long as you know about the updateValue() method, that code is brilliantly readable – the use of filter() means it’s clear what the loop is trying to do. However, if you don’t know about updateValue() then I suspect it falls short and is best avoided.
 */
