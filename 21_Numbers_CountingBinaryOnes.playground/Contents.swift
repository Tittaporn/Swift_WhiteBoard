import UIKit

//Challenge 21: Numbers_CountingBinaryOnes
//Swift Coding Challenges By Paul Hudson

/*
 Create a function that accepts any positive integer and returns the next highest and next lowest number that has the same number of ones in its binary representation. If either number is not possible, return nil for it.
 
 Sample input and output
 • The number 12 is 1100 in binary, so it has two 1s. The next highest number with that many 1s is 17, which is 10001. The next lowest is 10, which is 1010.
 • The number 28 is 11100 in binary, so it has three 1s. The next highest number with that many 1s is 35, which is 100011. The next lowest is 26, which is 11010.
 
 Hints
 Hint #1: You can find the binary representation of an integer by converting it to a string – look for a “radix” initializer.
 Hint #2: You should be using radix 2, which is binary.
 Hint #3: Your return value ought to be (nextHighest: Int?, nextLowest: Int?).
 Hint #4: You can count the 1s in a stringified number by using filter() on its letters property.
 Hint #5: Don’t be afraid to duplicate code while you’re working – you need to search up and down for the same thing, so start with duplication then refactor.
 Hint #6: You can’t create ranges where the end is higher than the start. Instead, create a forwards range then reverse it.
 */

func countBinaryOnes(number: Int) -> (Int?,Int?) {
    
    let numberInBinary = String(number, radix: 2)
    let countedOnesOfBinary = numberInBinary.filter {String($0) == "1"}.count
    var higest: Int?
    var lowest: Int?
    
    for i in number + 1...Int.max {
        let countedOnesOfi = String(i, radix: 2).filter {String($0) == "1"}.count
        if  countedOnesOfi  == countedOnesOfBinary {
            higest = i
            break
        }
    }
    
    for i in (0...number - 1).reversed() {
        let countedOnesOfi = String(i, radix: 2).filter {String($0) == "1"}.count
        if  countedOnesOfi  == countedOnesOfBinary {
            lowest = i
            break
        }
    }
    
    print("\n===================higest :: \(higest)======================IN \(#function)\n")
    print("\n===================lowest :: \(lowest)======================IN \(#function)\n")
    return (higest,lowest)
}

countBinaryOnes(number: 2)
countBinaryOnes(number: 28)

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 This is a classic computing science problem, although I have to admit Swift makes it quite easy thanks to its range of String initializers.
 First and most importantly, you get the binary representation of an integer like this:
 
 let binaryString = String(someNumber, radix: 2)
 
 With that done, you can count the 1s by filtering by character and counting the resulting array:
 All that leaves is finding the next highest and lowest, which can be done by counting upwards or downwards until the you back the same number of ones.
 Here’s the complete solution:
 
 let numberOfOnes = binaryString.filter { (char: Character) -> Bool in char == "1" }.count
 */

func challenge21a(number: Int) -> (nextHighest: Int?, nextLowest: Int?) {
    let targetBinary = String(number, radix: 2)
    let targetOnes = targetBinary.filter { (char: Character) -> Bool in char == "1"}.count
    var nextHighest: Int? = nil
    var nextLowest: Int? = nil
    for i in number + 1...Int.max {
        let currentBinary = String(i, radix: 2)
        let currentOnes = currentBinary.filter { (char: Character) -> Bool in char == "1" }.count
        if targetOnes == currentOnes {
            nextHighest = i
            break
        }
    }
    for i in (0 ..< number).reversed() {
        let currentBinary = String(i, radix: 2)
        let currentOnes = currentBinary.filter { (char: Character) -> Bool in char == "1" }.count
        if targetOnes == currentOnes {
            nextLowest = i
            break
        }
    }
    return (nextHighest, nextLowest)
}

/*
 Looking at that code, the duplication of binary counting does rather stick out. We can refactor it into a nested function to remove the duplication, although it only reduces the overall size of the solution by a little:
 */

func challenge21b(number: Int) -> (nextHighest: Int?, nextLowest: Int?) {
    func ones(in number: Int) -> Int {
        let currentBinary = String(number, radix: 2)
        return currentBinary.filter { (char: Character) -> Bool in char == "1"}.count
    }
    let targetOnes = ones(in: number)
    var nextHighest: Int? = nil
    var nextLowest: Int? = nil
    for i in number + 1...Int.max {
        if ones(in: i) == targetOnes {
        nextHighest = i
        break
        }
    }
    for i in (0 ..< number).reversed() {
        if ones(in: i) == targetOnes {
        nextLowest = i
        break
        }
    }
    return (nextHighest, nextLowest)
}

challenge21b(number: 12)
challenge21b(number: 28)

