import UIKit

//Challenge 15: Reverse the words in a string
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that returns a string with each of its words reversed but in the original order,
 without using a loop.
 
 Sample input and output
 • The string “Swift Coding Challenges” should return “tfiwS gnidoC segnellahC”.
 • The string “The quick brown fox” should return “ehT kciuq nworb xof”.
 */

func reverseWordsOf(_ string: String) -> String {
    let array = string.components(separatedBy: " ")
    let reverseStrings = array.map {String($0.reversed())}
    return reverseStrings.joined(separator: " ")
}

reverseWordsOf("Swift Coding Challenges")
reverseWordsOf("The quick brown fox")

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 The requirement not to use a loop is what makes this a taxing challenge; if you could just use for-in then it would be easy or tricky depending on who spoke to.
 The only sensible way to solve this is using functional programming: the need to convert from one kind of array (“words written left to right”) to another (“words written right to left”) is the perfect use case for map(), so most of what remains is creating the array by splitting on spaces then recreating the string once you’ve reversed the words.
 Here’s my solution:
 */

func challenge15(input: String) -> String {
    let parts = input.components(separatedBy: " ")
    let reversed = parts.map { String($0.reversed()) }
    return reversed.joined(separator: " ")
}
