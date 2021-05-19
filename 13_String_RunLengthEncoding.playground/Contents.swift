import UIKit

//Challenge 13: Run-length encoding
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that accepts a string as input, then returns how often each letter is repeated in
 a single run, taking case into account.
 
 Tip: This approach is used in a simple lossless compression technique called run-length encoding.
 
 Sample input and output
 • The string “aabbcc” should return “a2b2c2”.
 • The strings “aaabaaabaaa” should return “a3b1a3b1a3”
 • The string “aaAAaa” should return “a2A2a2”
 */

func runLengthEncodingOf(_ string: String) -> String {
    var stringLength = ""
    let array = string.map {String($0)}
    var currentLetter = array[0]
    var currentCount = 0
   
    for letter in array {
        if currentLetter == letter {
            currentCount += 1
        } else {
            stringLength.append(currentLetter + String(currentCount))
            currentCount = 1
        }
        currentLetter = letter
    }
    stringLength.append(currentLetter + String(currentCount))
    return stringLength
}

runLengthEncodingOf("aabbcc")
runLengthEncodingOf("aaabaaabaaa")
runLengthEncodingOf("aaAAaa")

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 There are two ways you could solve this, but in a stressful interview environment realistically there’s only one you’ll reach for: the “dumb”, brute force approach. I put dumb in quotes for a reason – more on that later.
 This approach would use an algorithm like this:
 • Create a currentLetter variable that contains an optional Character, as well as a counter integer and a return value string.
 • Loop through every letter in the input string.
 • If the letter is equal to our current letter, add one to the counter.
 • Otherwise, if currentLetter has a value it means we already had a letter and it’s about to
 change, so append it to the return string.
 • Regardless, update currentLetter to be the new letter, and reset the counter to 1.
 • Once the loop finishes, append currentLetter to the return string along with the counter,
 then return it.
 That last step is easily forgotten – because the return string is only modified when the letter changes, the last letter sequence won’t be added unless we do it by hand.
 Putting that into code: */

func challenge13a(input: String) -> String {
    var currentLetter: Character?
    var returnValue = ""
    var letterCounter = 0
    for letter in input {
        if letter == currentLetter {
            letterCounter += 1 }
        else {
            if let current = currentLetter {
                returnValue.append("\(current)\(letterCounter)")
            }
            currentLetter = letter
            letterCounter = 1
        }
    }
    if let current = currentLetter {
        returnValue.append("\(current)\(letterCounter)")
    }
       return returnValue
    }

/*
 An alternative solution, which is probably one you would be more likely to use if you had come to Swift after learning a different language, would be to use character look ahead: if the next character is different to the current one, or if we’re about to hit the end of the array, then modify the return value and reset the counter.
 This alternative solution doesn’t come naturally to Swift developers, because indexing into strings is expensive in Swift thanks to the grapheme cluster system. However, you could convert the Swift character index into an array, then use that. This would give you the following solution:
 */

func challenge13b(input: String) -> String {
    var returnValue = ""
    var letterCounter = 0
    let letterArray = Array(input)
    for i in 0 ..< letterArray.count {
        letterCounter += 1
        if i + 1 == letterArray.count || letterArray[i] != letterArray[i + 1] {
            returnValue += "\(letterArray[i])\(letterCounter)"
            letterCounter = 0
        }
    }
       return returnValue
    }

/*
 That’s a valid solution, but does it beat the “dumb” one? Well, it depends what you mean by “beat”: it’s certainly less code, it avoids the if let repetition, and it should run a little faster – but could you remember it in an interview situation? Writing fast code is important when you’re building for production, but much less important when in an interview!
 */
