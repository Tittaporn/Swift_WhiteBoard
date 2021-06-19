import UIKit

//Challenge 37: Count the number
//Swift Coding Challenges By Paul Hudson

/*
 Write an extension for collections of integers that returns the number of times a specific digit
 appears in any of its numbers.
 
 Sample input and output
 • The code [5, 15, 55, 515].challenge37(count: "5") should return 6.
 • The code [5, 15, 55, 515].challenge37(count: "1") should return 2.
 • The code [55555].challenge37(count: "5") should return 5.
 • The code [55555].challenge37(count: "1") should return 0.
 
 Hints
 Hint #1: You’ll need to extend the Collection type with a specific constraint rather than a protocol constraint.
 Hint #2: If you convert each number to a string, you can loop over its characters.
 Hint #3: If you were functionally inclined, you could solve this challenge using reduce() and
 filter().
 */

extension Collection where Iterator.Element == Int {
    func countTheNumber(_ number: Int) -> Int {
        var countedNumber = 0
        for item in self {
            let strItem = String(item)
            for letter in strItem {
                if String(number) == String(letter) {
                    countedNumber += 1
                }
            }
        }
        return countedNumber
    }
}

var test0 = [5, 15, 55, 515].countTheNumber(5)
var test1 = [5, 15, 55, 515].countTheNumber(1)
var test2 = [55555].countTheNumber(5)
var test3 = [55555].countTheNumber(1)

extension Collection where Iterator.Element == Int {
    func countTheNumberUsingReduce(_ count: Character) -> Int {
        return self.reduce(0) {$0 + String($1).filter{(char: Character) -> Bool in char == count}.count}
    }
}
var test00 = [5, 15, 55, 515].countTheNumberUsingReduce("5")
var test11 = [5, 15, 55, 515].countTheNumberUsingReduce("1")
var test22 = [55555].countTheNumberUsingReduce("5")
var test33 = [55555].countTheNumberUsingReduce("1")

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 To count the number of a specific digit inside an integer, the easiest thing to do is convert it to a string then check each character. Swift will only let you do this if you specify the correct constraint, which in this challenge ought to be Iterator.Element == Int, like this:
 */

extension Collection where Iterator.Element == Int {
    func challenge37a(count: Character) -> Int {
        var total = 0
        // loop over every element
        for item in self {
            // stringify this integer
            let str = String(item)
            // loop over letter in the string
            for letter in str {
                if letter == count {
                    total += 1 }
            }
        }
        return total
    }
}

/*
 A more interesting solution is to use reduce() to whittle down the array of integers into a single number, then use filter() on each item to pick out characters that match the input digit:
 */

extension Collection where Iterator.Element == Int {
    func challenge37b(count: Character) -> Int {
        return self.reduce(0) {$0 + String($1).filter { (char: Character) -> Bool in char == count }.count}
    }
}
/*
 That’s certainly much shorter, and arguably much clearer in its intent, but it’s unlikely to perform faster.
 */
