import UIKit

//4/27/2021

/* By Omri iOS38 White Board
 write a function that produces this result -- Ex:
 accum("abcd") -> "A-Bb-Ccc-Dddd"
 accum("RqaEzty") -> "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
 accum("cwAt") -> "C-Ww-Aaa-Tttt"
 */

var testWord = "abcd"
var accum = "cwAt"

func duplicateMoreCharacterOf(word: String) -> String {
    
    var returnString = ""
    var arrayString: [String] = []
    
    for w in word {
        arrayString.append(String(w).capitalized)
    }
    var index = 0
    for e in arrayString {
        for _ in 0...index {
            returnString.append(e)
        }
        returnString.append("-")
        index += 1
    }
    
    var uppercaseBeforeReturnString = ""
    var previousCharacter = ""
    for c in  String(returnString.dropLast()) {
        
        if previousCharacter == "-" {
            c.uppercased()
            uppercaseBeforeReturnString.append(c.uppercased())
        } else {
            c.lowercased()
            uppercaseBeforeReturnString.append(c.lowercased())
        }
        previousCharacter = String(c)
    }
    return uppercaseBeforeReturnString.capitalized
}

duplicateMoreCharacterOf(word: accum)
duplicateMoreCharacterOf(word: testWord)
