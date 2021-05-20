import UIKit

//Challenge 18: Recreate the pow()
//Swift Coding Challenges By Paul Hudson

/*
 Create a function that accepts positive two integers, and raises the first to the power of the second.
 
 Tip: If you name your function myPow() or challenge18(), you’ll be able to use the built-in
 pow() for your tests. The built-in pow() uses doubles, so you’ll need to typecast.
 
 Sample input and output
 • The inputs 4 and 3 should return 64, i.e. 4 multiplied by itself 3 times.
 • The inputs 2 and 8 should return 256, i.e. 2 multiplied by itself 8 times.

 */

func myPow(firstInput: Int, timeInput: Int) -> Int {
    var results = firstInput
    if timeInput == 1 {
        return firstInput
    } else {
        for _ in 1...timeInput - 1 {
            results *= firstInput
        }
        return results
    }
}

myPow(firstInput: 4, timeInput: 3)
myPow(firstInput: 2, timeInput: 8)
myPow(firstInput: 0, timeInput: 2)
myPow(firstInput: 4, timeInput: 1)

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 This ought to have been the easiest of easy challenges, because all you’re doing is multiplying a number against itself a fixed number of times.
 In its most simple form, you can solve the challenge like this:
 */

func challenge18a(number: Int, power: Int) -> Int {
    guard number > 0, power > 0 else { return 0 }
    var returnValue = number
    for _ in 1..<power {
        returnValue *= number}
   return returnValue
}

/*
 Like I said in the hints, you could also solve this challenge using a recursive function. To do that, make the function multiply its input number by the return value of calling itself, subtracting 1 from the power parameter each time, like this:
 */

func challenge18b(number: Int, power: Int) -> Int {
    guard number > 0, power > 0 else { return 0 }
    if power == 1 { return number }
    return number * challenge18b(number: number, power: power - 1)
}
