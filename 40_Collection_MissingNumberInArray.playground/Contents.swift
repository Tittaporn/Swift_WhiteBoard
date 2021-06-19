import UIKit

//Challenge 40: Missing numbers in array
//Swift Coding Challenges By Paul Hudson

/*
 Create a function that accepts an array of unsorted numbers from 1 to 100 where zero or more numbers might be missing, and returns an array of the missing numbers.
 
 Sample input and output
 If your test array were created like this:
 var testArray = Array(1...100)
 testArray.remove(at: 25)
 testArray.remove(at: 20)
 testArray.remove(at: 6)
 
 Then your method should [7, 21, 26], because those are the numbers missing from the array.
 
 Hints
 Hint #1: There’s a naïve solution involving arrays, but it’s very slow.
 Hint #2: You should try using a Set, which has a significantly faster contains() method.
 Hint #3: You can compute the different between two sets using symmetricDifference().
 */

func missingNumbersInArray(_ numArray: [Int]) -> [Int] {
    let sortedNumArray = numArray.sorted()
    let lastElement = sortedNumArray.count - 1
    let newArray = Array(sortedNumArray[0]...sortedNumArray[lastElement])
    let setSortedArray = Set(sortedNumArray)
    let setNewArray = Set(newArray)
    var returnArray: [Int] = []
    for e in setNewArray {
        if !setSortedArray.contains(e) {
            returnArray.append(e)
        }
    }
    return returnArray
}

var testArray = Array(1...100)
testArray.remove(at: 25)
testArray.remove(at: 20)
testArray.remove(at: 6)
missingNumbersInArray(testArray)

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 If you create a new array with all numbers present, then you can loop over each number and check whether it exists in the input array. Any missing numbers get added to an array, and that array gets sent back as the return value for the method – simple, right? Here it is in Swift:
 */

func challenge40a(input: [Int]) -> [Int] {
    let correctArray = Array(1...100)
    var missingNumbers = [Int]()
    for number in correctArray {
        if !input.contains(number) {
            missingNumbers.append(number) }
    }
    return missingNumbers
}

/*
 The problem is, that solution is slow. We know that the input array will contain 100 items give or take some number of missing items, which means contains() will have to search through as many as 100 items before it can confirm it has found a number.
 A much faster solution is to use a set, which has an O(1) contains() method – it runs at the same speed no matter whether it contains one item or one thousand. You can construct a set directly from the input array, and immediately the code will run around 10x faster for our test case:
 */

func challenge40b(input: [Int]) -> [Int] {
    let correctArray = Array(1...100)
    let inputSet = Set(input)
    var missingNumbers = [Int]()
    for number in correctArray {
        if !inputSet.contains(number) {
            missingNumbers.append(number) }
    }
    return missingNumbers
}

/*
 A third possible option is to use set algebra: if we construct a set from both the correct answer and from the input array, we can calculate the missing numbers by subtracting one from the other, then sorting the result.
 This involves a little more work: this creates a new set with only elements that appear in both, creates an array out of that set, then sorts it. Still, it’s at least worth reading the code:
 */

func challenge40c(input: [Int]) -> [Int] {
    let inputSet = Set(input)
    let testSet = Set(1...100)
    return Array(testSet.subtracting(inputSet)).sorted()
}
