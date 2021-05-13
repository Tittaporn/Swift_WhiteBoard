import UIKit

//Challenge 3: Do two strings contain the same characters?
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that accepts two String parameters, and returns true if they contain the same
 characters in any order taking into account letter case.
 
 The strings “abca” and “abca” should return true.
 The strings “abc” and “cba” should return true.
 The strings “ a1 b2 ” and “ b1 a2 ” should return true.
 The strings “abc” and “abca” should return false.
 The strings “abc” and “Abc” should return false.
 The strings “abc” and “cbAa” should return false.
 The strings “abcc” and “abca” should return false.
 */

func doTwoStringHaveSameCharacters(firstString: String, secondString: String) -> Bool {
    var checkedSecondString = secondString
    for letter in firstString {
        guard let index = checkedSecondString.firstIndex(of: letter) else {return false}
            checkedSecondString.remove(at: index)
    }
   return checkedSecondString.count == 0
}

doTwoStringHaveSameCharacters(firstString: "abca", secondString: "abca")
doTwoStringHaveSameCharacters(firstString: "abc", secondString: "cba")
doTwoStringHaveSameCharacters(firstString: " a1 b2 ", secondString: " b1 a2 ")
doTwoStringHaveSameCharacters(firstString: "abc", secondString: "abca")
doTwoStringHaveSameCharacters(firstString: "abc", secondString: "Abc")
doTwoStringHaveSameCharacters(firstString: "abc", secondString: "cbAa")
doTwoStringHaveSameCharacters(firstString: "abcc", secondString: "abca")

// firstIndex(of:), which is O(n) ==> Worse
// remove(at:) call is also O(n),

//==============================================================================================================================
//Solution by By Paul Hudson
/*
 You could write a naïve solution to this problem by taking a variable copy of the second input string, then looping over the first string and checking each letter exists in the second. If it does, remove it so it won’t be counted again; if not, return false. If you get to the end of the first string, then return true if the second string copy is now empty, otherwise return false.
 For example:
 */

 func challenge3a(string1: String, string2: String) -> Bool {
    var checkString = string2
    for letter in string1 {
            if let index = checkString.firstIndex(of: letter) {
                checkString.remove(at: index)
            } else {
          return false
       }
    }
    return checkString.count == 0
}

/*
 That solution works, but is less than ideal because you’re having to look up letter positions repeatedly using firstIndex(of:), which is O(n). Worse, the remove(at:) call is also O(n), because it needs to move other elements down in the array once the item is removed.
 A simpler solution is to remember that strings are sequences in Swift and sort them directly. Once that’s done, you can do a direct comparison using ==. This ends up involving much less code:
 */

 func challenge3b(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
 }

