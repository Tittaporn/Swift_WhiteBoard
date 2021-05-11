import UIKit

//Challenge 5: Count the Character
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that accepts a string, and returns how many times a specific character appears,
 taking case into account.
 Tip: If you can solve this without using a for-in loop, you can consider it a Tricky challenge.
 Sample input and output
 • The letter “a” appears twice in “The rain in Spain”.
 • The letter “i” appears four times in “Mississippi”.
 • The letter “i” appears three times in “Hacking with Swift”.
 */

extension String {
    func countTheCharacterOf(_ character: Character) -> Int {
        var count: Int = 0
        for letter in self {
            if letter == character {
                count += 1
            }
        }
        return count
    }
    
    func countTheCharacterByReduce(character: Character) -> Int {
        return self.reduce(0) {$1 == character ? $0 + 1 : $0}
    }

    func countTheCharacterByNSCountSet(character: String) -> Int {
        let array = self.map { String($0) }
        let counted = NSCountedSet(array: array)
        return counted.count(for: character)
    }
}


let theRainInSpain = "The rain in Spain"
theRainInSpain.countTheCharacterOf("a")
theRainInSpain.countTheCharacterByReduce(character: "a")
theRainInSpain.countTheCharacterByNSCountSet(character: "a")

let mississippi = "Mississippi"
mississippi.countTheCharacterOf("i")
mississippi.countTheCharacterByReduce(character: "i")
mississippi.countTheCharacterByNSCountSet(character: "i")

let hackingWihSwift = "Hacking with Swift"
hackingWihSwift.countTheCharacterOf("i")
hackingWihSwift.countTheCharacterByReduce(character: "i")
hackingWihSwift.countTheCharacterByNSCountSet(character: "i")

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 You might be surprised to hear me saying this, but: this is a great interview question. It’s simple to explain, it’s simple to code, and it has enough possible solutions that it’s likely to generate some interesting discussion – which is gold dust in interviews.
 This question is also interesting, because it’s another good example where the simple brute force approach is both among the most readable and most efficient. I suggested two alternatives in the hints, and I think it’s an interesting code challenge for you to try all three.
 First, the easy solution: loop over the characters by hand, comparing against the check character. In code, it would be this:
 */

 func challenge5a(input: String, count: Character) -> Int { var letterCount = 0
    for letter in input {
        if letter == count {
            letterCount += 1
        }
    }
    return letterCount
 }
/*
 There’s nothing complicated there, but do make sure you accept the check character as a Character to make the equality operation smooth.
 The second option is to solve this problem functionally using reduce(). This has the advantage of making for very clear, expressive, and concise code, particularly when combined with the ternary operator:
 */

 func challenge5b(input: String, count: Character) -> Int {
    return input.reduce(0){$1 == count ? $0 + 1 : $0 }
 }

/*
 So, that will start with 0, then go over every character in the string. If a given letter matches the input character, then it will add 1 to the reduce counter, otherwise it will return the current reduce counter. Functional programming does make for shorter code, and the intent here is nice and clear, however this is not quite as performant – it’s likely to run about 10% slower than the first solution depending on your configuration.
 A third solution is to use NSCountedSet, but that’s wasteful unless you intend to count several characters. It’s also complicated because Swift bridges String to NSObject well, but doesn’t bring Character, so NSCountedSet won’t play nicely unless you convert the characters yourself. So, your code would end up being something like this:
 */
 func challenge5c(input: String, count: String) -> Int {
    let array = input.map { String($0) }
    let counted = NSCountedSet(array: array)
    return counted.count(for: count)
 }

challenge5c(input: theRainInSpain, count: "a")
challenge5c(input: mississippi, count: "i")
challenge5c(input: hackingWihSwift, count: "i")

/*
 That creates an array of strings by converting each character in the input string, then creates a counted set from the string array, and finally returns the count – for a single letter. Wasteful, for sure, and inefficient too – a massive ten times slower than the original.
 There’s actually a fourth option you might have chosen. It’s the shortest option, however it requires a little lateral thinking: you can calculate how many times a letter appears in a string by removing it, then comparing the lengths of the original and modified strings. Here it is in Swift:
 */

 func challenge5d(input: String, count: String) -> Int {
    let modified = input.replacingOccurrences(of: count, with: "")
    return input.count - modified.count
 }
 
challenge5d(input: theRainInSpain, count: "a")
challenge5d(input: mississippi, count: "i")
challenge5d(input: hackingWihSwift, count: "i")
