import UIKit

//Challenge 1: Are the letters unique?
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that accepts a String as its only parameter, and returns true if the string has
 only unique letters, taking letter case into account.
 */

func areTheLettersUnique(word: String) -> Bool {
    var letterArray: [String] = []
    for letter in word {
        letterArray.append(String(letter))
    }
    if letterArray.count == Set(letterArray).count {
        return true
    } else {
        return false
    }
}

let noDuplicate = "No duplicates"
let aTOzLetters = "abcdefghijklmnopqrstuvwxyz"
let aaBbCc = "AaBbCc"
let helloWorld = "Hello, world"

areTheLettersUnique(word: aTOzLetters)
areTheLettersUnique(word: noDuplicate)
areTheLettersUnique(word: aaBbCc)
areTheLettersUnique(word: helloWorld)

//=====================================================================================
//Solution By Pual Hudson
/*There are two ways to solve this, both of which are perfectly fine given our test cases. First, the brute force approach: create an array of checked characters, then loop through every letter in the input string and append the latter to the list of checked characters, returning false as soon as a call to contains() fails.
Here’s how that code would look:
 */
func challenge1a(input: String) -> Bool {
var usedLetters = [Character]()
for letter in input {
if usedLetters.contains(letter) {
         return false
}
usedLetters.append(letter) }
return true
}

/*
 That solution is correct with the example input and output I provided, but you should be prepared to discuss that it doesn’t scale well: calling contains() on an array is an O(n) operation, which means it gets slower as more items are added to the array. If our text were in a language with very few duplicate characters, such as Chinese, this might cause performance issues.
 The smart solution is to use Set, which can be created directly from the input string. Sets cannot contain duplicate items, so if we create a set from the input string then the count of the set will equal the count of the input if there are no duplicates.
 In code you would write this:
 */
 func challenge1b(input: String) -> Bool {
    return Set(input).count == input.count
 }

