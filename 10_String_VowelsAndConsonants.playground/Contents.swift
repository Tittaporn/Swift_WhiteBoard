import UIKit

//Challenge 10: Vowels and Consonants
//Swift Coding Challenges By Paul Hudson

/*
 Given a string in English, return a tuple containing the number of vowels and consonants.
 Tip: Vowels are the letters, A, E, I, O, and U; consonants are the letters B, C, D, F, G, H, J, K, L, M, N, P, Q, R, S, T, V, W, X, Y, Z.
 
 Sample input and output
 • The input “Swift Coding Challenges” should return 6 vowels and 15 consonants.
 • The input “Mississippi” should return 4 vowels and 7 consonants.
 */

func countVowelsAndConsonantsOf(_ string: String) -> (vowels: Int, consonants: Int) {
    var vowelsCount = 0
    var consonantsCount = 0
    let vowelsArray = ["A", "E", "I", "O", "U"]
    let consonantsArray = ["B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y", "Z"]
    for letter in string {
        if consonantsArray.contains(String(letter).uppercased()) {
            consonantsCount += 1
        } else if vowelsArray.contains(String(letter).uppercased()) {
            vowelsCount += 1
        } else {
            print("\n===================ERROR! \(letter) is not vowels and consonants in English. IN\(#function) ======================\n")
        }
    }
    return (vowelsCount, consonantsCount)
}

countVowelsAndConsonantsOf("Swift Coding Challenges")
countVowelsAndConsonantsOf("Mississippi")

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 There are three interesting ways to solve this challenge, and I’m going to present them to you slowest first – although realistically you’ll only see significant performance differences if these functions are being called run a hundred times or more.
 First, you could use CharacterSet here, but it has a fatal flaw: even though “Character” is right there in the name, you can’t ask a character set whether it contains a single character because it works on a different type called UnicodeScalar. Instead, you need to convert the Character to a String, then use its rangeOfCharacter(from:) method, like this:
 */

func challenge10a(input: String) -> (vowels: Int, consonants: Int) {
    let vowels = CharacterSet(charactersIn: "aeiou")
    let consonants = CharacterSet(charactersIn: "bcdfghjklmnpqrstvwxyz")
    var vowelCount = 0
    var consonantCount = 0
    for letter in input.lowercased() {
        let stringLetter = String(letter)
        if stringLetter.rangeOfCharacter(from: vowels) != nil {
            vowelCount += 1
        } else if stringLetter.rangeOfCharacter(from: consonants) != nil {
            consonantCount += 1 }
    }
   return (vowelCount, consonantCount)
}

/*
 The second solution builds on the first: if you’re going to work with string methods, why not just skip the character set entirely? There’s a perfectly good contains() method on strings that works just as well, so you can avoid allocating a character set at all:
 */

func challenge10b(input: String) -> (vowels: Int, consonants: Int) {
    let vowels = "aeiou"
    let consonants = "bcdfghjklmnpqrstvwxyz"
    var vowelCount = 0
    var consonantCount = 0
    for letter in input.lowercased() {
        let stringLetter = String(letter)
        if vowels.contains(stringLetter) {
            vowelCount += 1
        } else if consonants.contains(stringLetter) {
            consonantCount += 1
        }
    }
   return (vowelCount, consonantCount)
}

/*
 The third option is to do away with strings entirely: create arrays of vowel characters and consonant characters, then use the contains() method on the arrays to see if each letter matches. In code, you’d get this:
 */

func challenge10c(input: String) -> (vowels: Int, consonants: Int) {
    let vowels = "aeiou"
    let consonants = "bcdfghjklmnpqrstvwxyz"
    var vowelCount = 0
    var consonantCount = 0
    for letter in input.lowercased() {
        if vowels.contains(letter) {
            vowelCount += 1
        } else if consonants.contains(letter) {
            consonantCount += 1 }
        }
    return (vowelCount, consonantCount)
}

/*
 There’s very little to separate each of these three answers in terms of performance, so go with whichever is most familiar to you.
 */
