import UIKit

//Challenge 7: Condense whitespace
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that returns a string with any consecutive spaces replaced with a single space.
 Sample input and output
 I’ve marked spaces using “[space]” below for visual purposes:
 • The string “a[space][space][space]b[space][space][space]c” should return “a[space]b[space]c”.
 • The string “[space][space][space][space]a” should return “[space]a”.
 • The string “abc” should return “abc”.
 */

func condenseWhitespace(_ string: String) -> String {
    let newString = string.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: .none)
    return newString
}

condenseWhitespace("   a")
condenseWhitespace("   v               a")
condenseWhitespace("abc")

func condenseWhitespaceForLoop(_ string: String) -> String {
    var seenSpace = false
    var retureString = ""
    for letter in string {
        if letter == " " {
            if seenSpace { continue }
            seenSpace = true
        } else {
            seenSpace = false
        }
        retureString += String(letter)
    }
    return retureString
}

condenseWhitespaceForLoop("   a")
condenseWhitespaceForLoop("   v               a")
condenseWhitespaceForLoop("abc")

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 As is the case for many other string challenges, we can write a naïve solution or a clever one, but here the clever one is dramatically simpler – and it uses regular expressions. (Yes, you did just read “simpler” and “regular expressions” in the same sentence.) But first, let’s look at something you might have tried:
 */

func challenge7(input: String) -> String {
    let components = input.components(separatedBy: .whitespacesAndNewlines)
    return components.filter { !$0.isEmpty }.joined(separator: " ")
}

/*
 That splits a string up by its spaces, then removes any empty items, and joins the remainder using a space, and is the ideal solution – if your goal is to remove any duplicate whitespace while also removing leading and trailing whitespace. However, it fails the requirement that “[space][space][space][space]a” should return “[space]a“, so you should have rejected it. Instead, you might have written a loop over the characters in the input string. If the current letter was a space and you had already seen one in this run, continue to the next letter. Otherwise, mark that you’ve seen a space. If it wasn’t a space, clear the space flag. Regardless of whether it was the first space or a letter, append it to an output string. Transform that into Swift and you get this:
 */

 func challenge7a(input: String) -> String {
    var seenSpace = false
    var returnValue = ""
    for letter in input {
        if letter == " " {
          if seenSpace { continue }
            seenSpace = true
        } else {
            seenSpace = false
        }
        returnValue.append(letter)
    }
    return returnValue
 }

/* This is a clear solution, and it works great. However, for once, this is a place where regular expressions can help: they turn all that into a single line of code:
 */

func challenge7b(input: String) -> String {
 return input.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
}
 
/* If you’re not familiar with regular expressions, “[space]+” means “match one or more spaces”, so that will cause all multiple spaces to be replaced with a single space. Running regular expressions isn’t cheap, so that code runs about 50% the speed of the manual solution, but you would have to be doing a heck of a lot of work in order for it to be noticeable.
 */
