import UIKit

//Challenge 9: Find Pangrams
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that returns true if it is given a string that is an English pangram, ignoring
 letter case.
 Tip: A pangram is a string that contains every letter of the alphabet at least once.
 
 Sample input and output
 • The string “The quick brown fox jumps over the lazy dog” should return true.
 • The string “The quick brown fox jumped over the lazy dog” should return false, because
 it’s missing the S.
 */

func isPangrams(_ string: String) -> Bool {
    let aToZ = "abcdefghijklmnopqrstuvwxyz"
    var arrayAToZ = aToZ.map {String($0)}
    for letter in string.lowercased() {
        if arrayAToZ.contains(String(letter)) {
            if let indexToDelete = arrayAToZ.firstIndex(of: (String(letter))) {
            arrayAToZ.remove(at: indexToDelete)
            }
        }
    }
    return arrayAToZ.isEmpty
}

isPangrams("The quick brown fox jumps over the lazy dog")
isPangrams("The quick brown fox jumped over the lazy dog")
//==============================================================================================================================
//Solution by By Paul Hudson

/*
 Solution
 You could try and solve this using character sets, but it’s really not needed: Swift’s characters conform to Comparable, so you can compare them against “a” and “z” directly to ensure they are alphabetical.
 Once you know how to ensure a letter is alphabetical, all that remains is removing duplicates (easy using a set) and collapsing case (lowercased() is fine), then comparing the count of the result against 26.
 So, here’s an example solution in just three lines of code:
 */

func challenge9(input: String) -> Bool {
    let set = Set(input.lowercased())
    let letters = set.filter { $0 >= "a" && $0 <= "z"}
    return letters.count == 26
}

challenge9(input: "The quick brown fox jumps over the lazy dog")
challenge9(input: "The quick brown fox jumped over the lazy dog")
