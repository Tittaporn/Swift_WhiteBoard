import UIKit

//Challenge 12: Find longest prefix
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that accepts a string of words with a similar prefix, separated by spaces, and
 returns the longest substring that prefixes all words.
 
 Sample input and output
 • The string “swift switch swill swim” should return “swi”.
 • The string “flip flap flop” should return “fl”.
 */

func findLongestPrefixOf(_ string: String) -> String {
    var currentPrefix = ""
    var prefix = ""
    let arrayOfString = string.split(separator: " ")
    let firstWord = arrayOfString[0]
    
    for letter in firstWord {
        currentPrefix.append(letter)
        for element in arrayOfString {
            if !element.hasPrefix(currentPrefix) {
                return prefix
            }
        }
        prefix = currentPrefix
    }
    return prefix
}

findLongestPrefixOf("swift switch swill swim")
findLongestPrefixOf("flip flap flop")


//==============================================================================================================================
//Solution by By Paul Hudson

/*
 I’ve watched some people blast through this code in a minute, and others struggle to finish in 30 minutes as they get into a mess of recursion.
 The key to a simple solution is the hasPrefix() method, which avoids the mess of string slicing: start with an empty string, then continue adding more letters from the first word until hasPrefix() fails for any of the other words.
 So: rather than trying to write a recursive function, you can solve this problem using an inner loop, like this:
 */

func challenge12(input: String) -> String {
    let parts = input.components(separatedBy: " ")
    guard let first = parts.first else { return "" }
    var currentPrefix = ""
    var bestPrefix = ""
    for letter in first {
        currentPrefix.append(letter)
        for word in parts {
            if !word.hasPrefix(currentPrefix) {
                return bestPrefix
            }
        }
        bestPrefix = currentPrefix
    }
    return bestPrefix
}
