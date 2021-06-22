import UIKit

//Challenge 41: Find the Median
//Swift Coding Challenges By Paul Hudson

/*
 Write an extension to collections that accepts an array of Int and returns the median average,
 or nil if there are no values.
 
 Tip: The mean average is the sum of some numbers divided by how many there are. The median average is the middle of a sorted list. If there is no single middle value – e.g. if there are eight numbers - then the median is the mean of the two middle values.
 
 Sample input and output
 • The code [1, 2, 3].challenge41() should return 2.
 • The code [1, 2, 9].challenge41() should return 2.
 • The code [1, 3, 5, 7, 9].challenge41() should return 5.
 • The code [1, 2, 3, 4].challenge41() should return 2.5.
 • The code [Int]().challenge41() should return nil.
 
 Hints
 Hint #1: You’ll need to extend Collection with a specific constraint.
 Hint #2: The method should return Double? because it might be a whole number, it might be a mean average of two numbers, or it might be nil if the collection is empty.
 Hint #3: If you divide an odd integer by two, Swift will round down.
 Hint #4: If you divide an even-numbered collection’s count by two, you’ll get the highest of the two values you need for your mean.
 Hint #5: Make life easy for yourself: sort the collection first.
 */

extension Collection where Iterator.Element == Int {
    func findTheMedian() -> Double? {
        guard self.count != 0  else { return nil }
        var theMedian: Double?
        let sorted = self.sorted()
        let positionOfMedian = self.count / 2
        if self.count % 2 == 1 {
            theMedian = Double(sorted[positionOfMedian])
        } else {
            theMedian = (Double(sorted[positionOfMedian-1]) + Double(sorted[positionOfMedian])) / 2
        }
        return theMedian
    }
    
    func findAverage() -> Double? {
        guard self.count != 0  else { return nil }
        var total = 0.0
        for e in self {
            total += Double(e)
        }
        return total / Double(self.count)
    }
}

let test0 = [1, 2, 3].findTheMedian()
let test1 = [1, 2, 9].findTheMedian()
let test2 = [1, 3, 5, 7, 9].findTheMedian()
let test3 = [1, 2, 3, 4].findTheMedian()
let test4 = [Int]().findTheMedian()

/*
 Not too hard, I think. Perhaps now you could try implementing a mode average too?
 */

let test00 = [1, 2, 3].findAverage()
let test11 = [1, 2, 9].findAverage()
let test22 = [1, 3, 5, 7, 9].findAverage()
let test33 = [1, 2, 3, 4].findAverage()
let test44 = [Int]().findAverage()



//==============================================================================================================================
//Solution by By Paul Hudson

/*
 Everyone knows how to do a mean average, because that’s by far the most common. The median average is a little bit out of the ordinary, so it might cause you to think back to school just a little.
 As a reminder, the median average of an array is the number that lies in its center once the array is sorted. If you have two items in the center – i.e., you have an array with an even number of items – then the median is the mean of the two center items.
 So, this is a fairly elementary challenge, spiced up a little by the need for you to frame it as an extension. Hopefully you figured out the extension constraint should be Iterator.Element == Int, at which point the reminder is plain sailing:
 */

extension Collection where Iterator.Element == Int { func challenge41() -> Double? {
    guard count != 0 else { return nil }
    // sort the items so we can find the center point
    let sorted = self.sorted()
    let middle = sorted.count / 2
    if sorted.count % 2 == 0 {
        // return mean average of two center items
        return Double(sorted[middle] + sorted[middle - 1]) / 2
    } else {
        // return the single center item
        return Double(sorted[middle])
    } }
}

