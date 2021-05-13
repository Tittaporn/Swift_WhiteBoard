import UIKit

//Challenge 8: String is rotated.
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that accepts two strings, and returns true if one string is rotation of the other, taking letter case into account.
 Tip: A string rotation is when you take a string, remove some letters from its end, then append them to the front. For example, “swift” rotated by two characters would be “ftswi”.
 
 Sample input and output
 • The string “abcde” and “eabcd” should return true.
 • The string “abcde” and “cdeab” should return true.
 • The string “abcde” and “abced” should return false; this is not a string rotation.
 • The string “abc” and “a” should return false; this is not a string rotation.
 */

func isRotatedString(inputString: String, rotatedString: String) -> Bool {
    if inputString.count != rotatedString.count {
        return false
    }
    let combinedInput = inputString + rotatedString
    return combinedInput.contains(rotatedString)
}

isRotatedString(inputString: "abcde", rotatedString: "eabcd")
isRotatedString(inputString: "abcde", rotatedString: "cdeab")
isRotatedString(inputString: "abcde", rotatedString: "abced")
isRotatedString(inputString: "abc", rotatedString: "a")

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 This question appears in coding interviews far more than it deserves, because it’s a problem that seems tricky the first time you face it but is staring-you-in-the-face obvious once someone has told you the solution. I wonder how many times this question appears on interviews just so the interviewer can feel smug about knowing the answer!
 Anyway, let’s talk about the solution. As I said in hint #3, if you write a string twice it must always encapsulate all possible rotations. So if your string was “abc” then you would double it to “abcabc”, which contains all possible rotations: “abc”, “cab”, and “bca”.
 So, an initial solution might look like this:

 */
func challenge8(input: String, rotated: String) -> Bool {
    let combined = input + input
    return combined.contains(rotated)
}

/* However, that’s imperfect – the final example input and output was that “abc” should return false when given the test string “a”. Using the code above, the input string would be double to “abcabc”, which clearly contains the test string “a”. To fix this, we need to check not only that the test string exists in the doubled input, but also that both strings are the same size.
So, the correct solution is this:
 */
func challenge8a(input: String, rotated: String) -> Bool {
    guard input.count == rotated.count else { return false }
    let combined = input + input
    return combined.contains(rotated)
}

/*
Like I said, it’s easier than you think, but is it a test of coding knowledge? Not really. If anything, you get a brief “aha!” flash when someone explains the solution to you, but apart from scoring you some interview brownie points I doubt this would be useful in real life.
*/
