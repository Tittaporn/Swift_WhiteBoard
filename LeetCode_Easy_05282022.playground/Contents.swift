import UIKit


func greeting(_ date: String)  {
    print("\n")
    print("--------------------- Hello, Lee At LeetCode on \(date) : You can do this challeges --------------------- ")
    print("\n")
}

func endOfDay(_ date: String) {
    print("\n")
    print("--------------------- End Of \(date) : Keep Going Hacker --------------------- ")
    print("\n")
}

func challengeOf(_ info: String) {
    print("\n------------------------------------------ Hacker Rank ------------------------------------------")
    print(info)
    print("-------------------------------------------------------------------------------------------------\n")
}

greeting("May 26 2022")

// ---------------------------------------------------------------------------------------------------------------
challengeOf("""
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.

Example 1:

Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
Example 2:

Input: nums = [3,2,4], target = 6
Output: [1,2]
Example 3:

Input: nums = [3,3], target = 6
Output: [0,1]
""")

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var arrayIndexOfTotalTarget: [Int] = []
    var foundPairOfTotalTarget = false
    for j in 0...nums.count - 1 {
        if !foundPairOfTotalTarget {
            for i in j+1...nums.count - 1 {
                let totalNum = nums[j] + nums[i]
                if totalNum == target {
                    arrayIndexOfTotalTarget.append(j)
                    arrayIndexOfTotalTarget.append(i)
                    foundPairOfTotalTarget = true
                    break;
                    
                }
            }
        }
    }
    return arrayIndexOfTotalTarget
}

let twoSumNumsnums = [2,7,11,15]
let twoSumTarget = 9
let testTwoSumNums = twoSum(twoSumNumsnums, twoSumTarget)
let twoSumNumsnums1 = [2,5,5,11]
let twoSumTarget1 = 10
let testTwoSumNums1 = twoSum(twoSumNumsnums1, twoSumTarget1)
print("twoSum : \(testTwoSumNums)")
print("twoSum1 : \(testTwoSumNums1)")

// ---------------------------------------------------------------------------------------------------------------

challengeOf("""
Number of Steps to Reduce a Number to Zero
Given an integer num, return the number of steps to reduce it to zero.

In one step, if the current number is even, you have to divide it by 2, otherwise, you have to subtract 1 from it.

Example 1:

Input: num = 14
Output: 6
Explanation:
Step 1) 14 is even; divide by 2 and obtain 7.
Step 2) 7 is odd; subtract 1 and obtain 6.
Step 3) 6 is even; divide by 2 and obtain 3.
Step 4) 3 is odd; subtract 1 and obtain 2.
Step 5) 2 is even; divide by 2 and obtain 1.
Step 6) 1 is odd; subtract 1 and obtain 0.
Example 2:

Input: num = 8
Output: 4
Explanation:
Step 1) 8 is even; divide by 2 and obtain 4.
Step 2) 4 is even; divide by 2 and obtain 2.
Step 3) 2 is even; divide by 2 and obtain 1.
Step 4) 1 is odd; subtract 1 and obtain 0.
Example 3:

Input: num = 123
Output: 12
""")

func numberOfSteps(_ num: Int) -> Int {
    var numberOfSteps = 0
    var newNum = num
    while newNum != 0 {
        if newNum % 2 == 0 {
            newNum = newNum / 2
        } else {
            newNum = newNum - 1
        }
        numberOfSteps += 1
    }
    return numberOfSteps
}

let testNumberOfSteps1 = numberOfSteps(14)
let testNumberOfSteps2 = numberOfSteps(8)
let testNumberOfSteps3 = numberOfSteps(123)
print("numberOfSteps : \(testNumberOfSteps1)")
print("numberOfSteps : \(testNumberOfSteps2)")
print("numberOfSteps : \(testNumberOfSteps3)")

// ---------------------------------------------------------------------------------------------------------------

challengeOf("""
Given an integer x, return true if x is palindrome integer.

An integer is a palindrome when it reads the same backward as forward.

For example, 121 is a palindrome while 123 is not.
 
Example 1:

Input: x = 121
Output: true
Explanation: 121 reads as 121 from left to right and from right to left.
Example 2:

Input: x = -121
Output: false
Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
Example 3:

Input: x = 10
Output: false
Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
""")

func isPalindrome(_ x: Int) -> Bool {
    if x < 0 {
        return false
    } else {
        let stringX = String(x)
        return stringX == String(stringX.reversed())
    }
}


func isPalindromeAgain(_ x: Int) -> Bool {
    if x < 0 {
        return false
    } else {
        let stringX = String(x)
        var arrayString : [Character] = []
        let middleIndex = stringX.count / 2
        for c in stringX {
            arrayString.append(c)
        }
        for i in 0...middleIndex {
            if arrayString[i] != arrayString[arrayString.count - 1 - i] {
                return false
            }
        }
        return true
    }
}
print("isPalindrome1 : \(isPalindrome(121))")
print("isPalindrome2 : \(isPalindrome(-121))")
print("isPalindrome3 : \(isPalindrome(10))")
print("isPalindromeAgain : \(isPalindrome(121))")
print("isPalindromeAgain : \(isPalindrome(-121))")
print("isPalindromeAgain : \(isPalindrome(10))")


// ---------------------------------------------------------------------------------------------------------------

challengeOf("""
Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

I can be placed before V (5) and X (10) to make 4 and 9.
X can be placed before L (50) and C (100) to make 40 and 90.
C can be placed before D (500) and M (1000) to make 400 and 900.
Given a roman numeral, convert it to an integer.

Example 1:

Input: s = "III"
Output: 3
Explanation: III = 3.
Example 2:

Input: s = "LVIII"
Output: 58
Explanation: L = 50, V= 5, III = 3.
Example 3:

Input: s = "MCMXCIV"
Output: 1994
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4
""")

func romanToInt(_ s: String) -> Int {
    var totalToReturn = 0
    var stringArray : [Character] = []
    for c in s {
        stringArray.append(c)
    }
    var i = 0
    while i != stringArray.count  {
        switch stringArray[i] {
        case "M":
            totalToReturn += 1000
        case "D":
            totalToReturn += 500
        case "C":
            if i < stringArray.count - 2 {
                if stringArray[i + 1] == "M" {
                    totalToReturn += 900
                    i += 1
                } else if stringArray[i + 1] == "D" {
                    totalToReturn += 400
                    i += 1
                } else if stringArray[i + 1] == "C" && stringArray[i + 2] == "C" {
                    totalToReturn += 300
                    i += 2
                } else if stringArray[i + 1] == "C" {
                    totalToReturn += 200
                    i += 1
                }
                else {
                    totalToReturn += 100
                }
            } else if i < stringArray.count - 1 {
                if stringArray[i + 1] == "M" {
                    totalToReturn += 900
                    i += 1
                } else if stringArray[i + 1] == "D" {
                    totalToReturn += 400
                    i += 1
                } else if stringArray[i + 1] == "C" {
                    totalToReturn += 200
                    i += 1
                }
                else {
                    totalToReturn += 100
                }
            } else {
                totalToReturn += 100
            }
        case "L":
            totalToReturn += 50
        case "X":
            if i < stringArray.count - 2 {
                if stringArray[i + 1] == "C" {
                    totalToReturn += 90
                    i += 1
                } else if stringArray[i + 1] == "L" {
                    totalToReturn += 40
                    i += 1
                } else if stringArray[i + 1] == "X" && stringArray[i + 2] == "X"{
                    totalToReturn += 30
                    i += 2
                } else if stringArray[i + 1] == "X" {
                    totalToReturn += 20
                    i += 1
                } else {
                    totalToReturn += 10
                }
            }  else if i < stringArray.count - 1  {
                if stringArray[i + 1] == "C" {
                    totalToReturn += 90
                    i += 1
                } else if stringArray[i + 1] == "L" {
                    totalToReturn += 40
                    i += 1
                    print(" i : \( i) at :\(#line)")
                } else if stringArray[i + 1] == "X" {
                    totalToReturn += 20
                    i += 1
                } else {
                    totalToReturn += 10
                }
                
            } else {
                totalToReturn += 10
            }
        case "V":
            totalToReturn += 5
        case "I":
            if i < stringArray.count - 2 {
                if stringArray[i + 1] == "X" {
                    totalToReturn += 9
                    i += 1
                } else if stringArray[i + 1] == "V" {
                    totalToReturn += 4
                    i += 1
                } else if stringArray[i + 1] == "I" && stringArray[i + 2] == "I"{
                    totalToReturn += 3
                    i += 2
                } else if stringArray[i + 1] == "I" {
                    totalToReturn += 2
                    i += 1
                }
                else {
                    totalToReturn += 1
                }
            } else if  i < stringArray.count - 1 {
                if stringArray[i + 1] == "X" {
                    totalToReturn += 9
                    i += 1
                } else if stringArray[i + 1] == "V" {
                    totalToReturn += 4
                    i += 1
                } else if stringArray[i + 1] == "I" {
                    totalToReturn += 2
                    i += 1
                }
                else {
                    totalToReturn += 1
                }
            } else {
                totalToReturn += 1
            }
        default:
            print("Character Not For Roman Number")
        }
        i += 1
    }
    return totalToReturn
}

print("romanToInt III : \(romanToInt("III"))")
print("romanToInt LVIII : \(romanToInt("LVIII"))")
print("romanToInt MCMXCIV : \(romanToInt("MCMXCIV"))")
print("romanToInt DCXXI : \(romanToInt("DCXXI"))")
print("romanToInt MDLXX : \(romanToInt("MDLXX"))")

// ---------------------------------------------------------------------------------------------------------------

challengeOf("""
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".

 Example 1:

 Input: strs = ["flower","flow","flight"]
 Output: "fl"
 Example 2:

 Input: strs = ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
""")

func longestCommonPrefix(strs: [String]) -> String {
    var longestConmmonPrefix: String = ""
    var charArray = [[Character]]()
    var currentIndexOfCharecter = 0
    
    for i in 0...strs.count - 1 {
        var chars: [Character] = []
        for c in strs[i] {
            chars.append(c)
        }
        charArray.append(chars)
    }
    
    for c in charArray[0] {
        var cIsSame = false
        for i in 0...charArray.count - 1 {
            if charArray[i][currentIndexOfCharecter] == c {
                cIsSame = true
            } else {
                cIsSame = false
                continue;
            }
        }
        if cIsSame {
            longestConmmonPrefix += String(c)
            
            currentIndexOfCharecter += 1
        } else {
            break;
        }
    }
    return longestConmmonPrefix
}

print("longestCommonPrefix : \(longestCommonPrefix(strs: ["flower","flow","flight"]))")
print("longestCommonPrefix : \(longestCommonPrefix(strs: ["dog","racecar","car"]))")

func longestCommonPrefix2(_ strs: [String]) -> String {
    guard strs.count > 0 else { return "" }
    var commonStr = strs[0]
    for str in strs {
        while !str.hasPrefix(commonStr) {
            commonStr = String(commonStr.dropLast())
        }
    }
    return commonStr
}

print("longestCommonPrefix2 : \(longestCommonPrefix2(["ab", "a"]))")

// ---------------------------------------------------------------------------------------------------------------

challengeOf("""
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 An input string is valid if:
 
 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
  
 Example 1:
 
 Input: s = "()"
 Output: true
 Example 2:
 
 Input: s = "()[]{}"
 Output: true
 Example 3:
 
 Input: s = "(]"
 Output: false
 """)
func isVaild(_ s: String) -> Bool {
    var chars: [Character] = []
    for c in s {
        chars.append(c)
    }
    var isVaild = false
    if chars.count % 2 == 0 {
        let lastIndex = chars.count - 1
        
        for i in 0...lastIndex {
            if i > 1 {
                if chars[i - 1] == "(" && chars[i] == ")" {
                    isVaild = true
                } else if chars[i - 1] == "{" && chars[i] == "}" {
                    isVaild = true
                } else if chars[i - 1] == "[" && chars[i] == "]" {
                    isVaild = true
                } else {
                    isVaild = false
                }
            } else {
                if chars[i] == "(" && chars[i + 1] == ")" {
                    isVaild = true
                } else if chars[i] == "{" && chars[i + 1] == "}" {
                    isVaild = true
                } else if chars[i] == "[" && chars[i + 1] == "]" {
                    isVaild = true
                } else {
                    isVaild = false
                }
            }
        }
        
    } else {
        isVaild = false
    }
    return isVaild
}

isVaild("(){}")
isVaild("()")
isVaild("()[]{}")
isVaild("(]")

// ---------------------------------------------------------------------------------------------------------------


