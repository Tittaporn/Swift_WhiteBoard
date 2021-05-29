import UIKit

//Challenge 23: Integer Disguised
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that accepts a string and returns true if it contains only numbers, i.e. the digits
 0 through 9.
 
 Sample input and output
 • The input “01010101” should return true.
 • The input “123456789” should return true.
 • The letter “9223372036854775808” should return true.
 • The letter “1.01” should return false; “.” is not a number.
 */

func integerDisguised(string: String) -> Bool {
    var isInterDisguised: Bool = true
    let arrayOfInteger = ["0","1","2","3","4","5","6","7","8","9"]
    for letter in string {
        if !arrayOfInteger.contains(String(letter)) {
            isInterDisguised = false
        }
    }
    return isInterDisguised
}

integerDisguised(string: "01010101")
integerDisguised(string: "123456789")
integerDisguised(string: "9223372036854775808")
integerDisguised(string: "1.01")

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 There are lots of ways of solving this challenge, but if you want to solve it clearly, concisely, and correctly then your options are more limited.
 There are two big gotchas when dealing with numbers. First, integers have a ceiling, beyond which they refuse to work. In Swift, the ceiling is 9,223,372,036,854,775,807, which is the largest number that can be represented by a signed 64-bit integer.
 The third test case I gave you was one higher than the maximum signed 64-bit integer, which was intentional. However, if you recognized that, you could have switched an unsigned integer and passed the challenge by writing code like this:
 */

func challenge23a(input: String) -> Bool {
    print("===================UInt(input) :: \(UInt(input))======================")
    return UInt(input) != nil
}

challenge23a(input: "9223372036854775808")

/*
 I can’t think of a faster, simpler way to solve this challenge. However, it’s also a bit of a fudge – all unsigned integers do is double the largest number you can address, so it would still fail if you added a 0 to the end of the existing big number.
 From there you might have migrated to using Int() to compare each individual letter in the string, like this:
 */

func challenge23b(input: String) -> Bool {
    for letter in input {
        if Int(String(letter)) == nil {
            return false
            }
    }
    return true
}

/*
 As you can see, you can create integers from strings, and strings from characters, but you can’t create integers from characters – d’oh. Still, though, this code runs fast: it bails out as soon as any non-matching letter is found, and only returns true if all digits converted to an integer successfully.
 An alternative solution is to use the rangeOfCharacter(from:) method, which lets you provide a character set and returns the location – if any – of those characters in the search string. In our case we know the numbers we want (digits), so we just need to get the inverse of that set using something like this:
 */

func challenge23c(input: String) -> Bool {
    return input.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
}

/*
 This solution is interesting because it highlights another curiosity of numbers: Apple, being the smart company it is, considers “decimal digits” to include numerals from other languages. I’m not sure how well this will print on your computer, but “٢” is the Arabic-Indic numeral 2.
 If you use the decimalDigits character set, it will include Arabic-Indic numerals as well as the numbers 0 through 9. While none of the test cases used Arabic-Indic numerals, if you wanted to conform strictly to the requirements for this challenge then you could use something like this:
 */

func challenge23d(input: String) -> Bool {
    return input.rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789").inverted) == nil
}

/*
 Perhaps now you understand why I graded this challenge as tricky rather than easy!
 */
