import UIKit

//Challenge 32: Word Frequency
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that accepts a filename on disk, loads it into a string, then returns the frequency of a word in that string, taking letter case into account. How you define “word” is worth considering carefully.
 
 Sample input and output
 • A file containing “Hello, world!” should return 1 for “Hello”
 • A file containing “Hello, world!” should return 0 for “Hello,” – note the comma at the end.
 • A file containing “The rain in Spain falls mainly on the plain” should return 1 for Spain,
 and 1 for “in”; the “in” inside rain, Spain, mainly, and plain does not count because it’s not
 a word by itself.
 • A file containing “I’m a great coder” should return 1 for “I’m”.
 Tip: Create different files on your desktop for each of your pieces of sample input, then pass the paths to those files into your function.
 
 Hints
 Hint #1: Being able to ask questions about definitions – “what is a word?” is an important skill in white boarding tests.
 Hint #2: I would suggest that splitting by any non-alphabetic character is a safe choice for defining words to begin with, but watch out for that last test case.
 Hint #3: There’s a built-in character set for letters, which includes uppercase and lowercase letters.
 Hint #4: All character sets have an inverted property that gives you the opposite. For letters that gives you all non-letters.
 Hint #5: Once you have a set of all non-letters, you can remove ' and split your string on that.
 Hint #6: The NSCountedSet class can count words in an array extremely efficiently.
 
 */


//==============================================================================================================================
//Solution by By Paul Hudson

/*
 There are two ways you could solve this, but both share a common component: getting an array of all the words. To do that, you should use CharacterSet, which lets you either construct a character set from scratch or use one of the built-in sets.
 In this instance, the built-in letters character set is almost good enough: if we invert it, we’ll get every non-letter. However, the last test case requires us to match “I’m” as one word, which means we can’t split on apostrophes. So, the code looks like this:

 Now that you have an array of all the words, there are three ways you could perform your counting.
 First, loop over every word then add 1 to its count, and finally put out the specific count for the word in question, like this:
 
    var nonletters = CharacterSet.letters.inverted nonletters.remove("'")
    let allWords = inputString.components(separatedBy: nonletters)
    var wordCounts = [String: Int]()
        for word in allWords {
            wordCounts[word, default: 0] += 1
        }
    return wordCounts[count, default: 0] ?? 0
 
 That code works, but it’s not terribly efficient – while there are some situations where counting every word would be beneficial, it wasn’t in the spec for this challenge. So, at the very least we could store significantly less data by just counting the one specific word we cared about, like this:
 
    var wordCount = 0
    for word in allWords {
        if word == count {
        wordCount += 1 }
    }
    return wordCount
 
 That’s an improvement, and it certainly uses less memory now. But if you wanted to ace this challenge properly, the best solution of all is to use the Foundation type NSCountedSet. This is a specialized set that stores each item only once, so you get the performance of regular sets, but acts like items are stored more than once, so you can ask “how many times does this item appear?”
 Using this, you can count all instances of a word like this:
 Regardless of which option you choose, the easy part is loading the file into a string – that can be done using the contentsOfFile: initializer for String, like this:
 let wordsSet = NSCountedSet(array: allWords) return wordsSet.count(for: count)
 That will either return the contents of the filename as a string, or return 0 immediately. So, here’s the final code for the function:
 */

func challenge32(filename: String, count: String) -> Int {
    guard let inputString = try? String(contentsOfFile: filename) else { return 0 }
    var nonletters = CharacterSet.letters.inverted
    nonletters.remove("'")
    let allWords = inputString.components(separatedBy: nonletters)
    let wordsSet = NSCountedSet(array: allWords)
    return wordsSet.count(for: count)
}

/*
 As a side benefit, you also get the flexibility benefit from the dictionary code, in that if you need to query other words you can do so for free because all the work has been done up front.
 */
