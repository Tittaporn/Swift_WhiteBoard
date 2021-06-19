import UIKit

//Challenge 38: Find N Smallest
//Swift Coding Challenges By Paul Hudson

/*
 Write an extension for all collections that returns the N smallest elements as an array, sorted
 smallest first, where N is an integer parameter.
 
 Sample input and output
 • The code [1, 2, 3, 4].challenge38(count: 3) should return [1, 2, 3].
 • The code ["q", "f", "k"].challenge38(count: 10) should return [“f”, “k”, “q”].
 • The code [256, 16].challenge38(count: 3) should return [16, 256].
 • The code [String]().challenge38(count: 3) should return an empty array.
 
 Hints
 Hint #1: You’ll need to extend the Collection type with a constraint.
 Hint #2: Finding the smallest of any value requires using the < operator, which is guaranteed
 to exist when something conforms to Comparable.
 Hint #3: The collection might be contain fewer than N items.
 Hint #4: The solution is made more interesting by the requirement to return a variable number of results.
 Hint #5: If you want to avoid complexity, use sorted().
 */

extension Collection where Iterator.Element: Comparable {
    func findNSmallest(count: Int) -> [Iterator.Element] {
        let sortedElements = self.sorted()
        var count = count
        var newArray: [Iterator.Element] = []
        for e in sortedElements {
            if count != 0 {
                newArray.append(e)
            }
            count -= 1
        }
        return newArray
    }
}

let test0 = [1, 2, 3, 4].findNSmallest(count: 3)
let test1 = ["q", "f", "k"].findNSmallest(count: 10)
let test2 = [256, 16].findNSmallest(count: 3)
let test3 = [String]().findNSmallest(count: 3)

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 Finding the single smallest value in a collection is easy enough; finding the two smallest values in a collection is fractionally harder, because you need to move the smallest to smaller if a suitable small new value comes in.
 Finding the N smallest numbers is more difficult again, or would be if you followed the same technique. Rather than keeping individual variables for smallest and smaller, you would need to keep a sorted array of small values, inserting new values in the correct position as they came in. This isn’t hard to code, but neither is it terribly fast, and it becomes pretty disastrously slow if you had to insert lots of numbers.
 A solution that’s significantly simpler and probably significantly faster too is to use the built-in sorted() method followed by prefix(), which returns the first N items in a collection. If there are fewer items than you request, prefix() will return as many as it can – perfect for this challenge.
 So, the smart solution is as follows:
 */

extension Collection where Iterator.Element: Comparable {
    func challenge38(count: Int) -> [Iterator.Element] {
        let sorted = self.sorted()
        return Array(sorted.prefix(count))
    }
}
