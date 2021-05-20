import UIKit

//Challenge 17: Generate a random number in a range
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that accepts positive minimum and maximum integers, and returns a random number between those two bounds, inclusive.
 
 Sample input and output
 • Given minimum 1 and maximum 5, the return values 1, 2, 3, 4, 5 are valid.
 • Given minimum 8 and maximum 10, the return values 8, 9, 10 are valid.
 • Given minimum 12 and maximum 12, the return value 12 is valid.
 • Given minimum 12 and maximum 18, the return value 7 is invalid.
 */

func generateARandomNumberFrom(minimum: Int, maximum: Int) -> Int {
    var array: [Int] = []
    for number in minimum...maximum {
        array.append(number)
    }
    return array.randomElement() ?? 0
}

generateARandomNumberFrom(minimum: 1, maximum: 5)
generateARandomNumberFrom(minimum: 8, maximum: 10)
generateARandomNumberFrom(minimum: 12, maximum: 12)
generateARandomNumberFrom(minimum: 12, maximum: 18)

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 There are several choices for random number generators, and your choice says a lot about your skill level. Very roughly:
 • If you used rand() you probably came from a C background, or don’t generally care about randomness.
 • If you used GameplayKit, you’re either fairly new to iOS development, or particularly interested in the random number generation shaping GameplayKit offers.
 • If you used arc4random() you’re showing some awareness of half-decent random number generator, but are unaware of – or uninterested in – modulo bias.
 • If you used arc4random_uniform(), then you’re showing some serious chops.
 • If you used Swift’s Int.random(in:) method then you’ve found the smartest and simplest solution. I wish more people knew about this method!
 Of the five options, Int.random(in:) will always be preferable because it’s the natural way of solving the problem:

 */

func challenge17a(min: Int, max: Int) -> Int {
    return Int.random(in: min...max)
}

challenge17a(min: 1, max: 5)

/*
 If you didn’t choose that, arc4random_uniform() is preferred amongst developers because it generates suitably random numbers for most purposes, it doesn’t require seeding, it isn’t prone to modulo bias, and it isn’t restricted to Apple platforms – it’s a commonly used C function that is well understood.
 Using arc4random_uniform() has three hiccups in Swift: it generates numbers from 0 up to an upper bound, it excludes the upper bound rather than including it, and it uses UInt32 rather than Int, so you need some typecasting.
 We can fix all those problems and still write just one line of code to solve the challenge:
 */

func challenge17b(min: Int, max: Int) -> Int {
    return Int(arc4random_uniform(UInt32(max - min + 1))) + min
}
