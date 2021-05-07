import UIKit

//Challenge 2: Is a string a palindrome?
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that accepts a String as its only parameter, and returns true if the string reads
 the same when reversed, ignoring case.
 */

func isPalindrome(word: String) -> Bool {
    return String(word.reversed()).lowercased() == word.lowercased()
}

let rotator = "rotator"//should return true.
let ratSentence = "Rats live on no evil star" // should return true.
let neverSentence = "Never odd or even" //should return false; even though the letters are the same in reverse the spaces are in different places.
let hellowWorld = "Hello, world" //should return false because it reads “dlrow ,olleH” backwards.

isPalindrome(word: rotator)
isPalindrome(word: ratSentence)
isPalindrome(word: neverSentence)
isPalindrome(word: hellowWorld)

//==============================================================================================================================

//Solution By Paul Hudson
/*This is one of the most common interview questions you’ll come across, and but fortunately
it’s nice and easy to solve thanks to the reversed() method.
One small wrinkle is that reversed() doesn’t actually return a string for performance reasons,
so you need to convert it to a string in order to perform the check, like this:
*/

func challenge2b(input: String) -> Bool {
let lowercased = input.lowercased()
return String(lowercased.reversed()) == lowercased
}







