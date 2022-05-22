import Cocoa

var greeting = "Hello, playground"

// 05/04/2022
let anna = "anna"
let carrace = ""
let palindromWords = "redivider, deified, civic, radar, level, rotor, kayak, reviver, racecar, madam, and refer"
let findHowManyPalindrom = "How many palindrom in this sentences anan redivider deified civic radar level rotor kayak"
let sentence = "madam anna kayak notaplindrom anna Civic racecar"


func isPalindrome(_ word: String) -> Bool {
    return word.lowercased() == String(word.reversed()).lowercased()
}

func isPalindromeNoReverse(_ word: String) -> Bool {
    var arrayOfCharInWord : [Character] = []
    for c in word.lowercased() {
        arrayOfCharInWord.append(c)
    }
    let middleIndex = arrayOfCharInWord.count / 2
    for i in 0...middleIndex {
        if arrayOfCharInWord[i] != arrayOfCharInWord[arrayOfCharInWord.count - 1 - i] {
            return false
        }
    }
    return true
}

func allPalindromCount(sentence: String) -> [String : Int] {
    let words = sentence.components(separatedBy: .whitespaces)
    var returnDict = [String: Int]()
    for word in words {
        if isPalindrome(word) {
        let count = returnDict[word] ?? 0
        returnDict[word] = count + 1
        }
    }
    return returnDict
}

let testSentencePalindromCount = allPalindromCount(sentence: sentence)
isPalindromeNoReverse("leveL")
let isAnnaPalindrome = isPalindrome("fdfddfdfdf")


func areLettersUnique(word: String) -> Bool {
    var charArray : [Character] = []
    for c in word {
        charArray.append(c)
    }
    return  word.count == Set(word).count
}

areLettersUnique(word: "No duplicates")
areLettersUnique(word: "abcdefghijklmnopqrstuvwxyz")
areLettersUnique(word: "Hello, world")
areLettersUnique(word: "AaBbCc")

