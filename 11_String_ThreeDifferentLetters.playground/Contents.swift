import UIKit

//Challenge 11: Three different letters
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that accepts two strings, and returns true if they are identical in length but have no more than three different letters, taking case and string order into account.
 
 Sample input and output
 • The strings “Clamp” and “Cramp” would return true, because there is one letter difference.
 • The strings “Clamp” and “Crams” would return true, because there are two letter differences.
 • The strings “Clamp” and “Grams” would return true, because there are three letter differences.
 • The strings “Clamp” and “Grans” would return false, because there are four letter differences.
 • The strings “Clamp” and “Clam” would return false, because they are different lengths.
 • The strings “clamp” and “maple” should return false. Although they differ by only one letter, the letters that match are in different positions.
 */

func threeDifferentLetters(string: String, comparedString: String) -> Bool {
    if string.count != comparedString.count {
        return false
    }
    var differentCount = 0
    let stringArray = string.map {String($0)}
    let comparedArray = comparedString.map {String($0)}
    
    for index in 0...string.count - 1 {
        if stringArray[index] != comparedArray[index] {
            differentCount += 1
        }
    }
    
    if differentCount > 3 {
        return false
    } else {
        return true
    }
}

threeDifferentLetters(string: "Clamp", comparedString: "Cramp")
threeDifferentLetters(string: "Clamp", comparedString: "Crams")
threeDifferentLetters(string: "Clamp", comparedString: "Grams")
threeDifferentLetters(string: "Clamp", comparedString: "Grans")
threeDifferentLetters(string: "Clamp", comparedString: "Clam")
threeDifferentLetters(string: "clamp", comparedString: "maple")
//==============================================================================================================================
//Solution by By Paul Hudson

/*
 This problem isn’t hard as long as you convert your strings into character arrays – if you don’t, you need to advance through string indices, which is never pleasant and certainly hard to do during an interview.
 The simplest, clearest way to solve this challenge is like so:
 1. Start with an early return in case the two strings have different lengths.
 2. Create arrays out of both strings.
 3. Initialize a differences counter to 0.
 4. Loop over the first array, using enumerated() so we get the current index as well as each
 character.
 5. Compare that character against the character at the same index in the other string array. 6. If they are different, add one to differences.
 7. If as a result of that differences is now 4, return false.
 8. On the other hand, if we get to the end of the array, it means we can return true.
 Something like this ought to do the trick:
 
 */
func challenge11(first: String, second: String) -> Bool {
    guard first.count == second.count else { return false }
    let firstArray = Array(first)
    let secondArray = Array(second)
    var differences = 0
    for (index, letter) in firstArray.enumerated() {
        if secondArray[index] != letter {
            differences += 1
            if differences == 4 {
                return false
            }
        }
    }
    return true
}
