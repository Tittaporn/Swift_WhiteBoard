import UIKit

//Challenge 24: Add Number Inside a String
//Swift Coding Challenges By Paul Hudson

/*
 Given a string that contains both letters and numbers, write a function that pulls out all the
 numbers then returns their sum.
 
 Sample input and output
 • The string “a1b2c3” should return 6 (1 + 2 + 3).
 • The string “a10b20c30” should return 60 (10 + 20 + 30).
 • The string “h8ers” should return “8”.
 */

func addNumberInsideAString(_ string: String) -> Int {
   var sum = 0
    var currentNumberInString = ""
    for letter in string {
        let strLetter = String(letter)
        if Int(strLetter) != nil {
            currentNumberInString += strLetter
        } else {
            sum += Int(currentNumberInString) ?? 0
            currentNumberInString = ""
        }
    }
    sum += Int(currentNumberInString) ?? 0
    return sum
}

addNumberInsideAString("a1b2c3")
addNumberInsideAString("a10b20c30")
addNumberInsideAString("h8ers")
//==============================================================================================================================
//Solution by By Paul Hudson

/*
 This is a personal favorite problem of mine – not because of its complexity, but more because of its usefulness for weeding out developers who have exaggerated a little on their résumé.
 You see, you can take a naïve approach to this challenge and get a solution that works efficiently with very little code. However, to do that you need to know how to convert characters to strings, and strings to integers, as well as how to use nil coalescing if you want to make the code neat. As a result, someone who has puffed up their résumé will find this harder than it ought to be, and their code will usually show them up.
 On the flip side, an experienced Swift developer who is out to impress might try and solve this using regular expressions, in which case now they have two challenges: summing the numbers, and making regular expressions work under pressure.
 Let’s take a look at the simple solution first, which is hopefully similar to the one you came up with. The algorithm is this:
 1. Create an empty string that represents the current number being read.
 2. Create a sum value that contains the total of all numbers so far, initialized to 0.
 3. Loop through every letter in the input string, converting the character to a String.
 4. If we can convert that string to an integer, add it to the current number string.
 5. Otherwise it’s not a number, so convert the current number string to an integer, or 0 if it’s
 an invalid integer, add it to the sum and clear the current number string.
 6. Finally, convert any remaining value in the current number string to an integer, and add it to
 sum.
 7. Return sum.
 Here’s that list translated into code:
 */

func challenge24a(string: String) -> Int {
    var currentNumber = ""
    var sum = 0
    for letter in string {
        let strLetter = String(letter)
        if Int(strLetter) != nil {
            currentNumber += strLetter }
            else {
                sum += Int(currentNumber) ?? 0
                currentNumber = ""
            }
    }
    sum += Int(currentNumber) ?? 0
    return sum
}

challenge24a(string: "a1b2c3")
challenge24a(string: "a10b20c30")
challenge24a(string: "h8ers")
/*
 Solving the same problem using regular expressions is a real nightmare, and highlights the worst of Swift’s string handling problems. You see, creating a regex requires a Swift string going in, but works entirely using NSRange rather than Swift’s string ranges. This means you need to use string.utf16.count to calculate the size of the range, and using string.count will introduce subtle bugs in your code.
 However, it gets really grim when trying to read the contents of each match. NSRegularExpression returns an array of NSTextCheckingResult, which contains the NSRange of each match but not the contents, so you need to read the substring using that range... which isn’t possible in Swift, because it uses string ranges rather than NSRange. *Sigh*...
 Anyway, if you want to prove you have more time than sense, here’s how to solve it using regular expressions:
 1. Create the regex (\\d+).
 2. Use its matches() method to pull out an array of NSTextCheckingResult objects.
 3. Typecast your input string as NSString to get a substring() method that works with the
 NSRange provided by each NSTextCheckingResult. 4. Send that substring into Int() to get an optional integer. 5. Strip out the optionality, then sum the integers.
 You can use compactMap() and reduce() for steps 4 and 5 if you really have something to prove, giving code like this:
 */
func challenge24b(string: String) -> Int {
    let regex = try! NSRegularExpression(pattern: "(\\d+)", options: [])
    let matches = regex.matches(in: string, options: [], range: NSRange(location: 0, length: string.utf16.count))
    let allNumbers = matches.compactMap { Int((string as NSString).substring(with: $0.range)) }
    return allNumbers.reduce(0, +)
}

/*
 That code runs significantly slower than the previous solution, largely because of the cost of creating the regex. If you were to run this method many times you should move the NSRegularExpression creation outside the method, at which point it runs “only” about half the speed of the previous solution.
 An alternative regex solution is to use Swift’s built-in regular expression replacement code to replace all non-numbers with something unique, such as dashes. We can then split by that character to make an array, then reduce that down to a single value, like this:

func challenge24c(string: String) -> Int {
    return string.replacingOccurrences(of: "\\D+", with: "-", options: .regularExpression)};
            .split(separator: "-").reduce(0) { $0 + Int(String($1))!
}

 If regex isn’t your thing, \\d means “anything that is a number” and \\D means “anything that isn’t a number. So, that will replace letters and punctuation with dashes, before splitting on dashes and reducing the resulting array down to a single value.
 */
