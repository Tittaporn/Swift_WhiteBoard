import UIKit

//Challenge 22: Binary Reverse
//Swift Coding Challenges By Paul Hudson

/*
 Create a function that accepts an unsigned 8-bit integer and returns its binary reverse, padded
 so that it holds precisely eight binary digits.
 Tip: When you get the binary representation of a number, Swift will always use as few bits as possible – make sure you pad to eight binary digits before reversing.
 
 Sample input and output
 • The number 32 is 100000 in binary, and padded to eight binary digits that’s 00100000. Reversing that binary sequence gives 00000100, which is 4. So, when given the input 32 your function should return 4.
 • The number 41 is 101001 in binary, and padded to eight binary digits that 00101001. Reversing that binary sequence gives 10010100, which is 148. So, when given the input 41 your function should return 148.
 • It should go without saying that your function should be symmetrical: when fed 4 it should return 32, and when fed 148 it should return 41.
 */

func binaryReverseOf(number: Int) -> Int{
    
    let numberInBinary = String(number, radix: 2)
    var eightStringInBinary: String = ""
    
    if numberInBinary.count < 8 {
        let addedPostions = 8 - (numberInBinary.count)
        for _ in 0..<addedPostions {
            eightStringInBinary += "0"
        }
        eightStringInBinary += numberInBinary
    } else {
        eightStringInBinary = numberInBinary
    }
    
    let reversedEightBinaryInString = String(eightStringInBinary.reversed())
    let reversedNumberToReturn = Int(reversedEightBinaryInString, radix: 2) ?? 0
    
    return reversedNumberToReturn
}

binaryReverseOf(number: 32)
binaryReverseOf(number: 41)
binaryReverseOf(number: 4)
binaryReverseOf(number: 148)

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 As long as you’re comfortable converting to and from binary, this challenge is not likely to pose any problems for you. In fact, apart from converting between binary and decimal, the only interesting parts of the problem are calculating how much zero padding to apply and reversing the binary representation.
 Calculating and adding the padding can be done by subtracting the current character count from 8, like this:
 
 let paddingAmount = 8 - binary.count
 let paddedBinary = String(repeating: "0", count: paddingAmount) + binary
 
 Reversing the padding binary representation is as easy as calling reversed() on the binary string, then creating a new string out of it, like this:
 
 let reversedBinary = String(paddedBinary.reversed()) With all that in mind, here’s a complete solution:
 */

func challenge22(number: UInt) -> UInt {
    let binary = String(number, radix: 2)
    let paddingAmount = 8 - binary.count
    let paddedBinary = String(repeating: "0", count: paddingAmount) + binary
    let reversedBinary = String(paddedBinary.reversed())
    return UInt(reversedBinary, radix: 2)!
}

challenge22(number: 148)
