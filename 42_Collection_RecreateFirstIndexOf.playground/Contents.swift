import UIKit

//Challenge 42: Recreate FirstIndexOf
//Swift Coding Challenges By Paul Hudson

/*
 Write an extension for all collections that reimplements the firstIndex(of:) method.
 
 Tip: This is one of the easiest standard library methods to reimplement, so please give it an especially good try before reading any hints.
 
 Sample input and output
 • The code [1, 2, 3].challenge42(firstIndexOf: 1) should return 0.
 • The code [1, 2, 3].challenge42(firstIndexOf: 3) should return 2.
 • The code [1, 2, 3].challenge42(firstIndexOf: 5) should return nil.
 
 Hints
 Hint #1: You will need to extend Collection using a constraint on the type of element it stores. Hint #2: Your return type should be Int? because the item might not exist in the collection.
 Hint #3: This would be a good time to use enumerated() to retrieve items and their index from a collection.
 */

extension Collection where Iterator.Element: Comparable {
    func recreateFirstIndexOf(_ element: Iterator.Element) -> Int? {
        var position: Int?
        var currentPosition = 0
        for e in self {
            if e == element {
                position = currentPosition
            } else {
                currentPosition += 1
            }
        }
        return position ?? nil
    }
}

let test0 = [1, 2, 3].recreateFirstIndexOf(1)
let test1 = [1, 2, 3].recreateFirstIndexOf(3)
let test2 = [1, 2, 3].recreateFirstIndexOf(5)

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 
 This is a marvelously simple challenge that is perfect for helping someone learn algorithms – it’s simple enough you can write it down on a piece of paper first time, but also demonstrates
 the importance of optional and protocol extensions all in one.
 To solve the challenge, you need to start by extending the Collection protocol using a constraint that elements must conform to Equatable. Without that constraint you can’t use ==, and therefore can’t tell whether you’ve found the correct item in the collection.
 Once that’s done, you just need to loop through all the items in your collection, perhaps using enumerated(), then return the matching index.
 Here’s an example solution:
 */

extension Collection where Iterator.Element: Equatable {
    func challenge42(firstIndexOf search: Iterator.Element) ->
    Int? {
        for (index, item) in self.enumerated() {
            if item == search { return index }
        }
        return nil }
}
