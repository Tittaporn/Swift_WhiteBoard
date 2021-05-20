import UIKit

//Challenge 2: Number is prime
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that accepts an integer as its parameter and returns true if the number is prime.
 
 Tip: A number is considered prime if it is greater than one and has no positive divisors other than 1 and itself.
 
 Sample input and output
 • The number 11 should return true.
 • The number 13 should return true.
 • The number 4 should return false.
 • The number 9 should return false.
 • The number 16777259 should return true.
 */

func isPrimeNumber(_ number: Int) -> Bool {
    if number <= 1 {
        return false
    } else {
        for num in 1...number {
            if number % num == 0 && num != number && num != 1 {
                return false
            }
        }
    }
    return true
}

isPrimeNumber(-1)
isPrimeNumber(1)
isPrimeNumber(2)
isPrimeNumber(11)
isPrimeNumber(13)
isPrimeNumber(4)
isPrimeNumber(9)
isPrimeNumber(16777259)

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 There’s a naïve solution to this problem, but it has terrible performance characteristics – there’s a reason I included 16,777,259 in the list of sample input and output.
 The naïve solution looks like this:
 */

func challenge20a(number: Int) -> Bool {
    guard number >= 2 else { return false }
    for i in 2 ..< number {
        if number % i == 0 {
         return false
      }
    }
    return true
}

/*
 That counts from 2 up to one less than the input number, and returns false if the input number divides equally into i. That works correctly. It has a guard statement at the front because the numbers 1 and lower are not prime by definition.
 The problem with this function is that it’s computationally expensive: 16,777,259 is a prime number, so this solution will divide from 2 up to 16,777,258 and find that none of them work before deciding that the number is prime.
 Consider this: if the number n is not prime, it means it can be reached by multiplying two factors, x and y. If both of those numbers were greater than the square root of n, then x * y would be greater than n, which is not possible. So, we can be sure that at least one of x or y is less than or equal to the square root of n.
 As a result of this, we can dramatically reduce our search space: rather than counting from 2 up to 16,777,259, we can square root the number and round up, to get 4097, then search up to there and no further. Remember, we don’t have to find both numbers that multiply to make n, just one of them, because if we find one – and it isn’t 1 or itself – it means n is not prime.
 So, we could write a second solution like this:
 */

func challenge20b(number: Int) -> Bool {
    guard number >= 2 else { return false }
    guard number != 2 else { return true }
    let max = Int(ceil(sqrt(Double(number))))
    for i in 2 ... max {
        if number % i == 0 {
         return false
      }
    }
    return true
}

/*
 Because this second solution uses the closed range operator, ..., rather than the half-open range operator, ..<, it’s important to add the second guard check at the top so that 2 doesn’t evaluate incorrectly.
 This second solution performs significantly faster for primes such as 16,777,259, because rather than around 16 million searches you’re now doing around 4000.
 */
