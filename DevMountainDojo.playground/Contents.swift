import UIKit


// The-dojo IOS39 by MaxPoff And iOS Developer's Solutions From DevMountain

/* By River McCaine iOS38 From iOS38DevMountain WhilteBoard
 Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.
 Follow up: Could you implement a solution using only O(1) extra space complexity and O(n) runtime complexity?
 Input: nums = [9,6,4,2,3,5,7,0,1]
 Output: 8
 Explanation: n = 9 since there are 9 numbers, so all numbers are in the range [0,9]. 8 is the missing number in the range since it does not appear in nums.
 */

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let numsSet = Set<Int>(nums)
        for num in 0...nums.count {
            if !numsSet.contains(num) {
                return num
            }
        }
        return 0
    }
}

func findTheMissingChildren(starterNumbers: [Int]) -> [Int] {
    
    let sortedNumbers = starterNumbers.sorted()
    let theCount = sortedNumbers.count
    print("\(theCount) numbers to be passed in.\n")
    var missingNumbers: [Int] = []
    // For every number in the range of 1 to (valueOfHighestNumber)
    for num in (1...sortedNumbers.last!) {
        // If the numbers passed do NOT contain a number in the range, append it to our missingNumbers array.
        if !(sortedNumbers.contains(num)) {
            missingNumbers.append(num)
            print("'\(num)' has just been addded to the list of missing numbers.")
            print("\(missingNumbers.count) numbers are missing.")
            print("Current list: \(missingNumbers)\n")
        } else {
            print("The number '\(num)' matches! Testing next number...\n")
        }
    }
    return missingNumbers
}
findTheMissingChildren(starterNumbers: [1, 3, 6 , 9, 14 ])

//=========================================================================================================================================
/*
 Write a function that takes in a String as its only parameter, and returns true if the string has only unique letters (letter case matters)
*/

//Mike Conner — 04/22/2021
func isUniqueCharactersin(string: String) -> Bool {
    var uniqueCharacters: [String] = []
    for character in string {
        if !uniqueCharacters.contains(character.description) {
            uniqueCharacters.append(character.description)
        }
        else { return false }
    }
    return true
}

//Tiffany Sakaguchi — 04/22/2021
//Method 1:
let stringToBeChecked = "ThisIsSampleTextToBeTested"

func checkStringForDuplicates(string: String) -> Bool {
    let charactersArray = Array(string)
    let charactersSet = Set(charactersArray)
    return charactersArray.count == charactersSet.count
}

print(checkStringForDuplicates(string: stringToBeChecked))

//Method 2:
func checkStringForDuplicates2(string: String) -> Bool {
    var tempSet = Set<Character>()
    for character in string {
        if tempSet.contains(character) {
            return false
        }
        tempSet.insert(character)
    }
    return true
}

print(checkStringForDuplicates2(string: stringToBeChecked))

//Gavin Craft — 04/22/2021
func onlyUniqueLetters(word:String) ->Bool{
    var letters:[String] = []
    for letter in word.lowercased(){
        if(letters.contains("\(letter)")){
            return false
        }
        letters.append("\(letter)")
    }
    return true
}

//James Phillips — 04/22/2021
func isUnique(all letters: String )-> Bool{
    return Set(letters).count == letters.count
}

// MaxPoff — 04/22/2021
func isUnique1(input: String) -> Bool {
    var usedLetters: [Character] = []
    for letter in input {
        if usedLetters.contains(letter) {
            return false
        }
        usedLetters.append(letter)
    }
    return true
}

func isUnique2(input: String) -> Bool {
    return Set(input).count == input.count
}

//=========================================================================================================================================

/*
 MaxPoff — 04/23/2021
 Just in case your brain isn't fried enough, already. Here's a fun one:
 Create your own ".contains()" method
 Click on the following message ONLY if you want a hint to help.
 Hint: create an extension on String, then create a function inside of the extension . This function will then become available on any string type, through dot syntax
 */

//Gavin Craft — 04/23/2021
extension String{
    func contains(value:String)->Bool{
        let characters = Array(self)
        var current = 0
        let len = value.count - 1
        while current < self.count{
            var compString = ""
            for i in current...(current+len){
                if((current+len)>0) && ((current+len) <= self.count-1){
                    compString += "\(characters[i])"
                }
            }
            if(compString == value){
                return true
            }
            current += 1
        }
        return false
    }
}

extension String {
    func customContains(input: String) -> Bool {
        return range(of: input, options: .caseInsensitive) != nil
    }
}

//Bryan"Danger"w — 04/23/2021
extension String {
    func kontains(string: String) -> Bool {
        guard string.count > 0, string.count <= self.count else {return false}
        let selfArray = Array(self)
        let stringArray = Array(string)
        let first = stringArray[0]
        //check
        func checkSegment(selfSnippet: [String.Element]) -> Bool {
            var selfA = selfSnippet
            guard let index = selfA.firstIndex(of: first) else {return false}
            guard selfA.count >= index + stringArray.count else {return false}
            let range = index...index + stringArray.count - 1
            if Array(selfA[range]) == stringArray {
                return true
            } else {
                selfA.remove(at: index)
                return checkSegment(selfSnippet: selfA)
            }
        }//end check
        return checkSegment(selfSnippet: selfArray)
    }
} //End of extension

//=========================================================================================================================================
/* MaxPoff — 04/24/2021
 Here's a classic:
 Create a function that takes in a string and returns true if the string is a palindrome (palindrome is the same forward and backward, like "racecar", or, "rats live on no evil star")
 I'll post my version ~24 hours from now, if it hasn't already been posted
 
 Reminders:
 The current problem will always be the pinned message in this channel.
 Of course you can google most of these, but I think you would be doing yourself a disservice. Struggle though it. Attempt it on your own. You certainly won't be able to google a whiteboard problem in an interview, and a practice test is much less helpful if you have the answer sheet next to you.
 */

//Stan Phillips — 04/24/2021
func isPalindrome(string: String) -> Bool {
    let alphaNumerics = string.filter { $0.isLetter || $0.isNumber }
    return alphaNumerics.lowercased() == String(alphaNumerics.lowercased().reversed())
}

//James Chun — 04/25/2021
func isPalindromeByJame(string: String) -> Bool {
    var string = string.lowercased()
    let numberOfCharacters = string.count
    //check first and last letter n/2 times and remove them
    for _ in 1...numberOfCharacters / 2 {
        if string.first != string.last {
            return false
        } else {
            string.removeFirst()
            string.removeLast()
        }
    }
    return true
}

isPalindromeByJame(string: "rats live on no evil star")

//Ethan Andersen — 04/25/2021
func isP(i: String) -> Bool {
    i.lowercased() == String(i.lowercased().reversed())
}

//MaxPoff — 04/26/2021
func isPalindrome(input: String) -> Bool {
    let lowercased = input.lowercased()
    return String(lowercased.reversed()) == lowercased
}

//=========================================================================================================================================
/*
//Ethan Andersen — 04/26/2021
//From Max: Dojo Project today: Create a function that proves the Earth is flat.
 
//Stan Phillips — 04/26/2021
func isEarthFlat(proof: Science) -> Bool {
    if !proof.isReal {
        return true
    }
    return false
}

//iKarly — 04/26/2021
func isEarthFlat(proof: Science) -> Bool {
    return !proof.isReal
}
*/

//=========================================================================================================================================
//MaxPoff — 04/26/2021
/*Write a function that accepts a string, and returns how many times a specific character appears, taking case into account.
 Black Diamond: Do it without using a for loop
 */

//Gavin Craft — 04/26/2021
func howManyAppear(word:String, letter:Character) ->Int{
    if(String(letter).count > 1){
        return -1 //-1 means bad happened
    }
    let mutatedLetter:Character = letter
    var mutatedWord = word
    var occurrences = 0
    while mutatedWord.contains(letter){
        guard let index = mutatedWord.firstIndex(of: mutatedLetter) else {return -1}
        mutatedWord.remove(at: index)
        occurrences += 1
    }
    return occurrences
}

//Mike Conner — 04/26/2021
func countInstances(of character: Character, in string: String) -> Int {
    string.filter { $0 == character }.count
}

//Justin Webster — 04/26/2021
func howManyAppearByJustin(word: String, letter: Character) -> Int {
    var lettersToCount:[Character] = []
    let lowercaseWord = word.lowercased()
    let lowercaseLetter = Character(letter.lowercased())
    for i in lowercaseWord {
        if i == lowercaseLetter {
            lettersToCount.append(i)
        }
    }
    return lettersToCount.count
}

//DanielDickey — 04/26/2021
func characterCount(characterToCount: String.Element, phrase: String) -> Int {
    var count = 0
    var phrase = phrase
    while phrase != "" {
        if phrase.first == characterToCount {
            count += 1
        }
        phrase.removeFirst()
    }
    return count
}

//bryan"Danger"w — 04/26/2021
func charCount(string: String, char: Character) -> Int {
    let array = Array(string).sorted()
    var count = 0
    guard var index = array.firstIndex(of: char) else {return 0}
    while index < array.count && array[index] == char {
        count += 1
        index += 1
    }
    return count
}

//Tiffany Sakaguchi — 04/26/2021
//Method 1: (recursive)
func characterCountRecursive(_ string: String) -> [Character : Int] {
    guard !string.isEmpty else { return [:] }
    if string.count == 1, let character = string.first { return [character : 1] }
    let midIndex = string.index(string.startIndex, offsetBy: string.count / 2)
    let firstHalf = String(string[..<midIndex])
    let secondHalf = String(string[midIndex...])
    return characterCountRecursive(firstHalf).merging(characterCountRecursive(secondHalf)) { $0 + $1 }
}

//Method 2:
func countCharacters2(string: String) -> [Character: Int] {
    return string.map { [$0: 1] }.reduce([:]) { $0.merging($1) { $0 + $1 } }
}

//MaxPoff — 04/26/2021
func characterCount1(input: String, character: Character) -> Int {
    var letterCount = 0
    for letter in input {
        if letter == character {
            letterCount += 1
        }
    }
    return letterCount
}

func characterCount2(input: String, character: Character) -> Int {
    return input.reduce(0) { $1 == character ? $0 + 1 : $0 }
}

func characterCount3(input: String, character: String) -> Int {
    let modified = input.replacingOccurrences(of: character, with: "")
    return input.count - modified.count
}

//=========================================================================================================================================
/*
 Write a function that takes in a String, and returns that string with all duplicate letters removed. Parameter and return should be String
 */

//Omri Horowitz — 04/27/2021
//bonus points because that works with more than just string :stuck_out_tongue: but feel free to add string specifically to the parentheses if you desire
extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}

//Tiffany Sakaguchi — 04/27/2021
//Method 1 (return order matters):
func removeDuplicatesOrderMatters(string: String) -> String {
    return NSOrderedSet(array: Array(string)).reduce("") { $0 + "\($1)"}
}

//Method 2 (return order does not matter):
func removeDuplicatesInString(string: String) -> String {
    return String(Set(string))
}

//Here's a fun method, taking advantage of how .updateValue() returns a nil if there wasn't an existing value
func removeDuplicate(string: String) -> String {
    var used: [Character: Bool] = [:]
    let result = string.filter { used.updateValue(true, forKey: $0) == nil }
    return String(result)
}

//Justin Webster — 04/27/2021
func removeDuplicates(word: String) -> String {
    var wordToCheck: [Character] = [Character](word.lowercased())
    var wordToPrint: [Character] = []
    for letter in wordToCheck {
        wordToPrint.append(letter)
        wordToCheck.removeFirst()
        if wordToCheck.contains(letter) {
            wordToPrint.removeLast()
            wordToCheck.append(letter)
        }
    }
    return String(wordToPrint)
}

//=========================================================================================================================================
/*
 MaxPoff — 04/28/2021
 Write a function that returns a string with any consecutive spaces replaced with a single space.
 Example input and output:
 In: "this       is      a      test"
 Out: "this is a test"
 */

//Ethan Andersen — 04/28/2021
func spaceCleanup(text: String) {
    let cleanText = text.split(separator: " ")
    print(cleanText.joined(separator: " "))
}

//Tiffany Sakaguchi — 04/28/2021
func removeConsecutiveSpacesLoop(string: String) -> String {
    var tmpString = string
    while tmpString.contains("  ") {
        tmpString = tmpString.replacingOccurrences(of: "  ", with: " ")
    }
    return tmpString
}

//RyanG — 04/28/2021
extension String {
    /// New property so I can use keypath subscript
    var isNotEmpty: Bool { !self.isEmpty }
    func filterOut(_ set: CharacterSet, separator: String = " ") -> String {
        /// separate the string into an array based on the characterset provided
        self.components(separatedBy: set)
            /// Separating the string based on the character set inserts empty strings in place of those characters, we filter those out using `.filter()` and the keypath for our `.isNotEmpty` property
            .filter(\.isNotEmpty)
            /// Once the empty strings are removed, we can then join the array back into one string using the provided separator
            .joined(separator: separator)
    }
}
/// Remove only whitespaces
print("this       is      a      test".filterOut(.whitespaces))

/// Remove white space and new lines
print("""
    This      is
    a
    
    test
    """.filterOut(.whitespacesAndNewlines))

/// Get to only int values with a phone number
print("(801) 123-4567".filterOut(.whitespaces, separator: "")
        .filterOut(.punctuationCharacters, separator: ""))

//MaxPoff — 04/28/2021
func removeDuplicateWhiteSpace(input: String) -> String {
    return input.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
}

//=========================================================================================================================================
/*
 MaxPoff — 04/29/2021
 Given a string (written in English), return a tuple containing the number of vowels and consonants.
 Hints:
 Output should look like this: (vowels: Int, consonants: Int)
 Remember to account for punctuation...that should not increase the vowel and consonant counts
 */

//Ethan Andersen — 04/29/2021
func vowelConsonantsCount(String: String) -> (Vowels: Int, Consonants: Int) {
    var vowelCount = 0
    var consCount = 0
    let consonants = ["b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","z"]
    let vowels = ["a","e","i","o","u","y"]
    for l in String {
        for v in vowels {
            if v.contains(l) {
                vowelCount += 1
            }
        }
        for c in consonants {
            if c.contains(l) {
                consCount += 1
            }
        }
    }
    return (vowelCount, consCount)
}

//RyanG — 04/29/2021
extension Character {
    var isVowel: Bool {
        switch self {
        case "a", "e", "i", "o", "u", "y":
            return true
        default:
            return false
        }
    }
}

func filterVowelsAndConsonants(_ string: String) -> (vowels: Int, consonants: Int) {
    let sanitizedString = string.lowercased()
    let vowels = sanitizedString.filter(\.isVowel)
    let consonants = sanitizedString.filter({ $0.isLetter && !$0.isVowel })
    return (vowels.count, consonants.count)
}

//Tiffany Sakaguchi — 04/29/2021
func countVowelsAndConsonants(string: String) -> (vowelCount: Int, consonantCount: Int) {
    let vowels = CharacterSet(charactersIn: "aeiou")
    let consonants = CharacterSet(charactersIn: "bcdfghjklmnpqrstvwxyz")
    let strippedStringNoVowels = string.lowercased().components(separatedBy: vowels).joined()
    let strippedStringNoConsonants = string.lowercased().components(separatedBy: consonants).joined()
    let vowelCount = string.count - strippedStringNoVowels.count
    let consonantCount = string.count - strippedStringNoConsonants.count
    return (vowelCount, consonantCount)
}

//=========================================================================================================================================
/*
 Write a function that prints all possible permutations of a given input string.
 Example in out:
 In: “abc”
 Out: “abc”, “acb”, “bac”, “bca”, “cab”, “cba”
 */

//Gavin Craft — 04/30/2021
func permutations(left:Int, right:Int, stringyBoi:String){
    if(left==right){
        print(stringyBoi)
        return
    }
    var newStringyBoi = stringyBoi
    for i in Range(left...right){
        newStringyBoi = swapCharacters(newStringyBoi, index1: left, index2: i)
        permutations(left: left+1, right: right, stringyBoi: newStringyBoi)
        newStringyBoi = swapCharacters(newStringyBoi, index1: left, index2: i)
    }
}

func swapCharacters(_ strink: String, index1:Int, index2: Int) ->String{
    var characters:[Character] = []
    for i in strink{
        characters.append(i)
    }
    let charindex1 = characters[index1]
    let charindex2 = characters[index2]
    characters[index2] = charindex1
    characters[index1] = charindex2
    var returnBoi = ""
    for i in characters{
        returnBoi += String(i)
    }
    return returnBoi
}

func giveAllPermutations(_ t: String){
    permutations(left: 0, right: t.count-1, stringyBoi: t)
}

//bryan"Danger"w — 05/01/2021
func permutations(input: String) {
    switch input.count {
    case 0:
        print("")
    case 1:
        print(input)
    default:
        let inputA = Array(input)
        var wordsA: [[Character]] = []
        //factorial
        func factorial(input: Int) -> Int {
            if input == 1 {
                return input
            } else {
                return input * factorial(input: input - 1)
            }
        }//End factorial
        let count = factorial(input: inputA.count - 1)
        for letter in inputA {
            var placeholder: [[Character]] = []
            let letterholder = [letter]
            var otherholder = inputA
            guard let index = otherholder.firstIndex(of: letter) else {return}
            otherholder.remove(at: index)
            while placeholder.count < count {
                otherholder.shuffle()
                let holder = letterholder + otherholder
                if !placeholder.contains(holder) {
                    placeholder.append(holder)
                }
            }
            wordsA.append(contentsOf: placeholder)
        }
        let words = wordsA.compactMap { String($0) }
        print(words, "--- \(words.count)")
    }
}

//RyanG — 05/01/2021
extension String {
    func findPermutations() -> [String] {
        var set = Set<[String]>()
        let characters = self.map({ String($0) })
        characters.permute(characters, toArray: [], set: &set)
        return set.compactMap({ $0.joined(separator: "") })
    }
}

extension Array {
    func permute<T>(_ fromArray: [T], toArray: [T], set: inout Set<[T]>) {
        if toArray.count >= self.count {
            set.insert(toArray)
        }
        if !fromArray.isEmpty {
            for (index, item) in fromArray.enumerated() {
                var newFrom = fromArray
                newFrom.remove(at: index)
                permute(newFrom, toArray: toArray + [item], set: &set)
            }
        }
    }
}

print("ABC".findPermutations())

//MaxPoff — 05/02/2021
func permutations(string: String, current: String = "") {
    let length = string.count
    let stringArray = Array(string)
    if (length == 0) {
        print(current)
    } else {
        for i in 0 ..< length {
            let left = String(stringArray[0 ..< i])
            let right = String(stringArray[i+1 ..< length])
            permutations(string: left + right, current: current + String(stringArray[i]))
        }
    }
}

permutations(string: "123")

//Omri Horowitz — Yesterday at 12:43 PM
extension String {
    func allPermutationsOfUniqueString() -> [String] {
        guard let last = last else { return [""] }
        var permutations = ["\(last)"]
        dropLast().reversed().forEach { c in
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
        return permutations
    }
}

//=========================================================================================================================================
/*
 Write a function that counts from 1 through 100. You should print “Fizz” if a number is evenly divisible by 3, “Buzz” if evenly divisible by 5, and “Fizz Buzz” if evenly divisible by both three and five. If not divisible by either 3 or 5, you should print just the number.
 Black Diamond: do it using ternaries
 */

//Jenny Morales — Yesterday at 1:59 PM
func fizzBuzz(range: Int) {
    for num in 1...range {
        if num % 3 == 0 && num % 5 == 0 {
            print("Fizz Buzz")
        } else if num % 3 == 0 {
            print("Fizz")
        } else if num % 5 == 0 {
            print("Buzz")
        } else {
            print(num)
        }
    }
}

func fizzBuzz2(range: Int) {
    for num in 1...range {
        num % 3 == 0 ? (num % 5 == 0 ? print("Fizz Buzz") : print("Fizz")) : (num % 5 == 0 ? print("Buzz") : print(num))
    }
}

//Gavin Craft — Yesterday at 2:08 PM
func fizzbuzz(_ t: Int){
    if t <= 100{
        var printy = ""
        if t%3==0{
            printy += "fizz"
        }
        if t%5==0{
            printy += "buzz"
        }
        if printy==""{
            print("\(t)")
        }else{
            print("\(t): \(printy)")
        }
        fizzbuzz(t+1)
    }else {return}
}

//Tiffany Sakaguchi — Yesterday at 4:03 PM
func fizzBuzz(number: Int) {
    (1...number).forEach {index in
        var val: [String] = []
        if index % 3 == 0 {
            val.append("Fizz")
        }
        if index % 5 == 0 {
            val.append("Buzz")
        }
        if val.count == 0 {
            val.append("\(index)")
        }
        print(val.joined(separator: " "))
    }
}

//Justin Webster — Yesterday at 5:01 PM
func FizzBuzz() {
    for number in 1...100 {
        number % 3 == 0 && number % 5 == 0 ? print("Fizz Buzz") : number % 3 == 0 && number % 5 != 0 ? print("Fizz") : number % 3 != 0 && number % 5 == 0 ? print("Buzz") : print(number)
    }
}

//RyanG — Yesterday at 6:25 PM
extension Int {
    func isDivisible(by int: Int) -> Bool {
        self % int == 0
    }
}

func fizzBuzz(_ range: ClosedRange<Int> = 1...100) {
    range.forEach { number in
        switch true {
        case number.isDivisible(by: 15):
            print("Fizz Buzz")
        case number.isDivisible(by: 5):
            print("Buzz")
        case number.isDivisible(by: 3):
            print("Fizz")
        default:
            print("\(number)")
        }
    }
}

fizzBuzz()
fizzBuzz(101...200)

//Mike Conner — Yesterday at 8:53 PM
func fizzBuzz() {
    for number in 1...100 {
        switch (number % 5 == 0, number % 3 == 0) {
        case (true, true):
            print("Fizz Buzz")
        case(false, true):
            print("Fizz")
        case (true, false):
            print("Buzz")
        case(false, false):
            print("\(number)")
        }
    }
}

func fizzBuzzTernary() {
    for number in 1...100 {
        number % 5 == 0 && number % 3 == 0 ? print("Fizz Buzz") : number % 3 == 0 ? print("Fizz") : number % 5 == 0 ? print("Buzz") : print(number)
    }
}

//=========================================================================================================================================
//Gavin Craft — Yesterday at 5:11 PM
func whereIsIt5(time:Date = Date()) -> String{
    let remainingHours = 17-Calendar.current.component(.hour, from: time)
    let timeZoneSeconds = (remainingHours*3600)+Calendar.current.timeZone.secondsFromGMT()
    let newZone = TimeZone(secondsFromGMT: timeZoneSeconds)
    guard let newZone1 = newZone else {return "nowhere"}
    return newZone1.description
}
print("the time zone it is 5 in is \(whereIsIt5())")

//=========================================================================================================================================
/*
Create a function that accepts positive two integers, and raises the first to the power of the second.
WITHOUT using pow()
*/

//Gavin "Grandmaster" Craft — Today at 4:21 PM
func toPowerOf(a: Int, b: Int) ->Int{
    var newGuy = a
    for _ in 1...b-1{
        newGuy *= a
    }
    return newGuy
}

//Gavin "Grandmaster" Craft — Today at 5:36 PM
func toPowerOf(a: Int, b: Int, _ c: Int = 0) ->Int{
    let newA = a
    var newB = b
    var newC = c
    if(c==0){
        newB = b
        newC = a
    }else{
        newB = b
    }
    print(a,b,c)
    if(b == 1){
        return c
    }else{
        return toPowerOf(a:newA, b: newB-1, newC*newA)
    }
}

//Tiffany Sakaguchi — Today at 6:04 PM
func power(base: Int, exponent: Int) -> Int {
    var i = exponent
    var num = base
    while i > 1 {
        num *= base
        i -= 1
    }
    return num
}

//Tiffany Sakaguchi — Today at 6:13 PM
func powerByTiffany(base: Int, exponent: Int) -> Int {
    return Array(repeating: base, count: exponent).reduce(1, *)
}

//=========================================================================================================================================
/*
 MaxPoff — Today at 6:10 PM
 Swap two positive variable integers without using a temporary variable.
 */

//Tiffany Sakaguchi — Today at 6:37 PM
func swapNumbers(a: inout Int, b: inout Int) {
    a = a + b
    b = a - b
    a = a - b
}

var num1 = 5
var num2 = 10
print("Starting values: num1 = \(num1), num2 = \(num2)")
swapNumbers(a: &num1, b: &num2)
print("Ending values: num1 = \(num1), num2 = \(num2)")

//Justin Webster — Today at 6:42 PM
func raiseXToPowerY (x: Int, y: Int) -> Int {
    var xnumber = x
    if x % 2 == 0, y % 2 == 0 {
        for _ in 1...y - 1 {
            xnumber = (xnumber * x)
        }
    } else {
        print("Sorry, try even numbers.")
    }
    return xnumber
}

//Stan Phillips — Today at 6:45 PM
var a = 3
var b = 9
extension Int {
    mutating func swapWith(_ b: inout Int) {
        self = b + self
        b = self - b
        self = self - b
    }
}
print(a,b)
a.swapWith(&b)
print(a,b)

//Ethan Andersen — Today at 10:53 PM
func a(y: Int, z: Int) -> Int {
    let w: Int = y, x: Int = z, c: Int = y, i: Int = z
    var e: [Int] = [], d: [Int] = []
    var b: Int = 0, f: Int = 1, h: Int = y
    if w > 1 { if x > 1 {
        while b < i { do {
            d.append(b)
            b = b + 1 } }
        while f < d.count { do {
            e.append(c)
            f = f + 1 } }
        for g in e {
            h = h * g }
        return h } }
    else { print("Please only use positive numbers") }
    return h
}
print(a(y: 5, z: 3))

//=========================================================================================================================================
/*
 Write a function that accepts an integer as its parameter and returns true if the number is prime.
 */

//Gavin "Grandmaster" Craft — 05/05/2021 at 6:14 PM
func isPrime(num: Int, recurseNum: Int = 0) ->Bool{
    var placeholder = 0
    if recurseNum == 0{
        placeholder = num - 1
    }else{
        placeholder = recurseNum
    }
    if placeholder > 1{
        if(num%placeholder == 0){
            return false
        }else{
            return isPrime(num: num, recurseNum: placeholder-1)
        }
    }else{
        return true
    }
}

//James Chun — 05/05/2021 at 10:20 PM
func checkIfPrime(num: Int) -> Bool {
    var allRemainders: [Int] = []
    if num < 1 {
        return false
    }
    if num == 2 {
        return true
    }
    for i in 2...num - 1 {
        let remainder = num % i
        allRemainders.append(remainder)
    }
    if allRemainders.contains(0) {
        return false
    } else {
        return true
    }
}

func checkIfPrime2(num: Int) -> Bool {
    var newNum = num - 1
    if num < 1 {
        return false
    }
    while newNum > 2 {
        let remainder = num % newNum
        newNum -= 1
        
        if remainder == 0 {
            return false
        }
    }
    return true
}

//Trevor.Walker — 05/06/2021 at 12:09 AM
func isPrime(_ x: Int) -> Bool {
    if x == 2 {
        return true
    }
    if x < 2 || x % 2 == 0 {
        return false
    }
    for i in stride(from: 3, to: Int(Double(x).squareRoot()) + 1, by: 2) {
        if x % i == 0 {
            return false
        }
    }
    return true
}

//MaxPoff — 05/06/2021 at 9:55 AM
func prime1(number: Int) -> Bool {
    guard number >= 2 else {return false}
    for i in 2 ..< number {
        if number % i == 0 {
            return false
        }
    }
    return true
}
prime1(number: 2)

func prime2(number: Int) -> Bool {
    guard number >= 2 else {return false}
    guard number != 2 else {return true}
    let max = Int(ceil(sqrt(Double(number))))
    for i in 2 ... max {
        if number % i == 0 {
            return false
        }
    }
    return true
}
prime2(number: 17)

//RyanG — 05/06/2021 at 10:09 AM
extension Int {
    var isPrime: Bool {
        /// Ensure number is greater than 2, 1 is not a prime number
        guard self >= 2 else { return false }
        /// End early is number is 2 by hard checking, 2 is a prime number
        guard self != 2 else { return true }
        /// Easy modulo check on the number's divisibilty by 2
        guard self % 2 != 0 else { return false }
        /// Set upper limit of numbers to check by finding the square root of the number
        let upperLimit = Int(Double(self).squareRoot())
        /// Create a collection of numbers starting from 3 and ending at the upperLimit and stepping by 2
        let oddNumberCollection = stride(from: 3, through: upperLimit, by: 2)
        /// Check to see if the number is divisible by any of the odd numbers and return the desired result
        return !oddNumberCollection.contains { self % $0 == 0 }
    }
}

//Ethan Andersen — 05/06/2021 at 11:14 AM
func isPrime(value: Int) -> Bool {
    let basePrimes: [Int] = [2, 3, 5, 7, 11, 13]
    let value = value
    var answer: Bool = false
    for prime in basePrimes {
        if value % prime != 0 || value == prime {
            answer = true
        } else {
            answer = false
            break
        }
    }
    return answer
}

//=========================================================================================================================================
/*
 MaxPoff — 05/06/2021 at 2:37 PM
Create a function that accepts any positive integer and returns the next highest and next lowest number which have the same number of ones in their binary representations. If either number is not possible, return nil.

Hint:
You can find the binary representation of an integer by converting it to a string – look for a “radix” initializer.You'll need radix 2
filter()
*/

//Tiffany Sakaguchi — Today at 6:32 PM
func findNextAboveAndBelow(number: Int) -> (lower: Int?, upper: Int?) {
    guard number > 0 else {
        return (nil, nil)
    }
    let lowerNumber = (0..<number).reversed().first {
        number.nonzeroBitCount == $0.nonzeroBitCount
    }
    let upperNumber = ((number + 1)..<Int.max).first {
        number.nonzeroBitCount == $0.nonzeroBitCount
    }
    return (lowerNumber, upperNumber)
}

findNextAboveAndBelow(number: 100)

//Trevor.Walker — 05/08/2021 at 11:54 AM
func nextHighestAndLowest(_ x: Int) -> (h: Int?, l: Int?) {
    // Holders
    var l: Int?
    // 0 is a special number
    if x == 0 {
        return (h: nil, l: nil)
    }
    //If the number is a power of 2 then the next highest and lowest are simply the next and previous powers of 2
    if (x > 0) && (x & (x - 1) == 0) {
        //If x == 1 then there is no lower number
        if x == 1 {
            return (h: x * 2, l: nil)
        }
        return (h: x * 2, l: x / 2)
    }
    // Mark: Detect Lowest
    // if the number is one less than a root of two then no numbers below it will share the same amount of 1's
    if !((x - 1 > 0) && (x - 1 & (x - 1 - 1) == 0)) {
        for i in stride(from: x - 1, to: 0, by: -1){
            if i.nonzeroBitCount == x.nonzeroBitCount {
                l = i
                break
            }
        }
    }
    // Mark: Detect highest
    var i = x + 1
    while true {
        if i.nonzeroBitCount == x.nonzeroBitCount {
            return (h: i, l: l)
        }
        i += 1
    }
}

//=========================================================================================================================================
/*
 MaxPoff — 5/7/2021 at 5:45 PM
 Write a function that returns the square root of a positive integer, rounded down to the nearest integer, WITHOUT using sqrt().
 */

//Justin Webster — 5/7/2021 at 7:07 PM
func findSquareOfInt(int: Int) -> Int {
    var floorSqrt: Int = 0
    if int > 0 {
        for i in 1...int {
            if i * i > int {
                floorSqrt = i - 1
                break
            }
        }
    } else {
        return 5318008
    }
    return floorSqrt
}

//MaxPoff — 05/11/2021
func squareRoot(input: Int) -> Int {
    return Int(floor(pow(Double(input), 0.5)))
}

//=========================================================================================================================================
/*
 MaxPoff — 5/11/2021
 Write an extension for collections of integers, that returns the number of times a specific digit appears in any of its numbers.t of a positive integer, rounded down to the nearest integer, WITHOUT using sqrt().
 */

//Gavin "Grandmaster" Craft — 05/11/2021
//here is the non recursive
func giveInstancesNonRecursive(number: Int, findNum: Int)->Int{
    let digits = String(number).compactMap { Int(String($0)) }
    var numberUses: Int = 0
    for digit in digits{
        if digit == findNum{
            numberUses += 1
        }
    }
    return numberUses
}

//and here is recursive
func giveInstances(number: Int, findNum: Int, remainingMap: [Int] = [-1], foundNumber:Int = 0) -> Int{
    if remainingMap == []{
        //we done so return
        return foundNumber
    }
    var digits = (remainingMap != [-1]) ? remainingMap : String(number).compactMap { Int(String($0)) }
    var instances = foundNumber
    if digits[0] == findNum{
        instances += 1
    }
    digits.remove(at: 0)
    return giveInstances(number: number, findNum: findNum, remainingMap: digits, foundNumber: instances)
}

//Trevor.Walker — 5/12/2021 at 3:03 PM
extension Numeric {
    func occurencesOf(_ x: Int) -> Int {
        "\(self)".filter({ "\($0)" == "\(x)" }).count
    }
}

//MaxPoff — 5/12/2021  at 3:28 PM
extension Collection where Iterator.Element == Int {
    func occurences2(count: Character) -> Int {
        return self.reduce(0) {$0 + String($1).filter { (char: Character) -> Bool in char == count }.count
        }
    }
}

//=========================================================================================================================================
/*
 MaxPoff — 5/12/2021
 Write an extension for all collections that returns the N smallest elements as an array, sorted smallest first, where N is an integer parameter.
 */

//RyanG — 5/12/2021 at 4:13 PM
extension Int {
    var digits: [Character] {
        return [Character](String(self))
    }
}

extension Collection where Iterator.Element == Int {
    func findOccurences(of int: Int) -> Int {
        guard int.digits.count <= 1 else {
            assertionFailure("Pass only an integer with a single digit value")
            return 0
        }
        let characters = self.map(\.digits).reduce([], +)
        return characters.filter({ Int(String($0)) == int }).count
    }
}

//Gavin "Grandmaster" Craft — 5/12/2021 at 5:53 PM
extension Collection where Iterator.Element == Int{
    func findNSmallestNumbers(n:Int) -> [Int]{
        let sorted = self.sorted()
        var valueToReturn: [Int] = []
        var index = 0
        while index < n{
            valueToReturn.append(sorted[index])
            index += 1
        }
        return valueToReturn
    }
}
