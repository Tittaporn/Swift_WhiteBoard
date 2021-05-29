import UIKit

//Challenge 25: Calculate A Square Root by hand
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that returns the square root of a positive integer, rounded down to the nearest
 integer, without using sqrt().
 
 Sample input and output
 • The number 9 should return 3.
 • The number 16777216 should return 4096.
 • The number 16 should return 4.
 • The number 15 should return 3.
 
 */

func calculateSquareRootOf(_ input:Int) -> Int {
    var numberToReturn = 0
    for i in 0...input {
        if i * i == input {
            numberToReturn = i
            break;
        }
    }
    return numberToReturn
}

calculateSquareRootOf(1)
calculateSquareRootOf(9)
calculateSquareRootOf(16777216)
calculateSquareRootOf(16)
calculateSquareRootOf(15)

func calculateSquareRootOfAndRoundDown(_ input:Int) -> Int {
    var numberToReturn = 0
    for i in 0...input {
        if i * i == input {
            numberToReturn = i
            break;
        } else if i * i >= input {
            numberToReturn = i - 1
            break;
        }
    }
    return numberToReturn
}

calculateSquareRootOfAndRoundDown(9)
calculateSquareRootOfAndRoundDown(16777216)
calculateSquareRootOfAndRoundDown(16)
calculateSquareRootOfAndRoundDown(15)

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 Like most coding interview problems, this one has a naïve solution, a smart solution, and a sneaky solution.
 The naïve solution is trivial: loop from 1 up to one higher than half the test number, checking to see whether that number squared is greater than the test number. If it is, return the number directly below. We need to add a special case for 1, because otherwise the code returns 0.
 Here’s the code:
 */

func challenge25a(input: Int) -> Int { guard input != 1 else { return 1 }
    for i in 0 ... input / 2 + 1 {
        if i * i > input {
        return i - 1 }
    }
    return 0
}

/*
 However, consider the second test case, which is calculating the square root of 16,777,216. That’s going to require 4097 multiplications before returning the correct response, which is massively wasteful.
 A smarter solution is to use a binary search, which massively reduces the search space. Given the input number 10 it works like this:
 • Start by specifying a high bound of half the input number plus one, rounding down so for the input number 10 that gives us a high bound of 6.
 • Now specify a low bound, which will be zero to begin with.
 • Calculate the mid-point of the two, which is equal to half of upper - lower, plus the lower. So that’s lower + ((upper - lower) / 2), which is 0 + ((6 - 0) / 2), which is 0 + (6 / 2), which is 0 + 3 – so our mid-point is 3.
 • You then square your mid-point (3 x 3 is 9) and compare it against the input number.
 • If the square is less than the input it means that all the numbers from your low bound up to
 the mid-point are also too low, and so don’t need to be checked, so you can set the new low
 bound to be equal to your mid-point, then repeat.
 • If the square is higher than the input it means that all the numbers from the mid-point up to
 the upper bound are also too high, and so don’t need need to be checked, so you can set the
 new high bound to be equal to your mid-point, then repeat.
 • If the square is equal to the input, then you have your answer.
 • If you find that your lower bound + 1 is greater than or equal to your upper bound it means
 you’ve overshot the mark, so you should return the lower bound.
 I realize that sounds complicated, but it’s actually remarkably simple: “select the range it must be in, then try the middle of it. If you were too high you can eliminate the upper half of the range; if you were too low you can eliminate the lower half of the range. So, eliminate one half of the range then split the remaining half... and repeat.”
 This search technique is sometimes called a binary chop, because you halve your search space with each check. So to get 16,777,216 you halve to a range of 8,388,608, then halve that to a range of 4,194,304, then halve to a range of 2,097,152, then 1,048,576, then 524,288, then 262,144, then 131,072, then 65,536, and so on.
 Using this approach takes only 11 loops to figure out the square root of 16,777,216, compared to 4097 loops using the naïve method, so it runs a great deal faster. Nice! Here’s the code:
 */

func challenge25b(input: Int) -> Int { guard input != 1 else { return 1 }
    var lowerBound = 0
    var upperBound = 1 + input / 2
    while lowerBound + 1 < upperBound {
        let middle = lowerBound + ((upperBound - lowerBound) / 2)
        let middleSquared = middle * middle
        if middleSquared == input {
            return middle
        } else if middleSquared < input {
            lowerBound = middle
        } else {
            upperBound = middle
        } }
    return lowerBound
}

/*
 So, that’s the naïve approach and the smart approach, but there’s also a sneaky approach: the challenge is to calculate the square root of an integer without using sqrt(), but it didn’t say not to use the pow() function. If you request a number raised to the power of 0.5, you get its square root. The calculation isn’t precisely the same – a true square root will yield ever so slightly different results, and will be optimized for that task – but given that we’re working with integers the two will be identical.
 So, here’s how to solve the challenge using pow(), which will run so fast it’s hard to benchmark meaningfully:
 */

func challenge25c(input: Int) -> Int {
    return Int(floor(pow(Double(input), 0.5)))
}

/*
 Note the extensive typecasting, which is unavoidable I’m afraid – pow() works with doubles, not integers, so we need to typecast and floor before converting to an integer for the return value.
 */
