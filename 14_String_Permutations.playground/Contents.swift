import UIKit

//Challenge 14: String Permutations
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that prints all possible permutations of a given input string.
 Tip: A string permutation is any given rearrangement of its letters, for example “boamtw” is a permutation of “wombat”.
 
 Sample input and output
 • The string “a” should print “a”.
 • The string “ab” should “ab”, “ba”.
 • The string “abc” should print “abc”, “acb”, “bac”, “bca”, “cab”, “cba”.
 • The string “wombat” should print 720 permutations.
 */

func permutation(_ string: String) -> [String] {
    guard let last = string.last else { return [""] }
        var permutations = ["\(last)"]
    string.dropLast().reversed().forEach { c in
            var nextPermutations = [String]()
            permutations.forEach { permutation in
                permutation.indices.forEach { i in
                    var permutation = permutation
                    permutation.insert(c, at: i)
                    nextPermutations.append(permutation)
                }
                nextPermutations.append(permutation.appending("\(c)"))
            }
            permutations = nextPermutations
        }
    print("\n=================== permutations.count : \(permutations.count) IN \(#function) ======================\n")
        return permutations
    }
permutation("a")
permutation("ab")
permutation("abc")
permutation("wombat")

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 This is a recursive function with lots of looping, but the nature of factorials is that the loops get smaller each time. Given the input string “wombat”, the first time the function is called you’ll need to loop from 0 up to 5, calling the recursive function each time.
 So, initially you’ll pick “w” as it’s the first letter, and in you go to the recursive function – but this time there are only five letters to loop over, so you choose “o”, and go into the function again, etc.
 Eventually you spell out “wombat”, which is the result of choosing the first remaining letter each time. But now that you’ve reached the deepest point of the recursion, you back up a level: when you had “womb” it chose the first letter in the remainder (“at”) to make “wombat”, but now that path has been explored it should choose the second remaining letter (“t”) to make “wombt”, at which point the only remaining letter now is “a” to make “wombta”.
 Again the recursion has maxed out, so now it will need to go back one level further: when it was at “wom” the remainder was “bat” so it chose the first letter, but now it should choose the second, to make “woma”, with “bt” as remainder. On the first pass it will choose “b” first then “t” (making “womabt”), and on the second it will choose “t” then “b” (making “womatb”). That subset of the path is now maxed out, so it will wind back to “wom” and “bat” and choose the third letter, to make “womt” with “ba” as remainder. So it will get “womtba” then “womtab”, and so on, and so on.
 That’s the algorithm. It sounds clunky when explained step by step, but trust me: a CPU flies through this. Here it is in code:
 */

func challenge14(string: String, current: String = "") {
    let length = string.count
    let strArray = Array(string)
    
    if (length == 0) {
        // there's nothing left to re-arrange; print the result
        print(current)
        print("******")
    } else {
        print(current)
        // loop through every character
        for i in 0 ..< length {
            // get the letters before me
            let left = String(strArray[0 ..< i])
             // get the letters after me
            let right = String(strArray[i+1 ..< length])
             // put those two together and carry on
            challenge14(string: left + right, current: current + String(strArray[i]))
        }
    }
}

challenge14(string: "womb")

/*
 Note: the print("******") and second print(current) call are there to help you see how the function works; they serve no functional purpose.
 */
