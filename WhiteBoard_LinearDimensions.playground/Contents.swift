import UIKit

//WhiteBoard Challenge 05/26/2021

let arrayOfNum = [2,3,4,67,85,868,3,4,6]

func findLargestNumbersOf(_ array: [Int]) -> Int {
    var largestNum: Int = array[0]
    for num in array {
        if num > largestNum {
            largestNum = num
        }
    }
    return largestNum
}

findLargestNumbersOf(arrayOfNum)

//===========================================================

func removeDuplicate(_ array: [Int]) -> [Int] {
    var newArrayWithNoDuplicate: [Int] = []
    for num in array {
        if !newArrayWithNoDuplicate.contains(num) {
            newArrayWithNoDuplicate.append(num)
        }
    }
    return newArrayWithNoDuplicate
}

//removeDuplicate(arrayOfNum)

func removeDuplicateWithSet(_ arrayInput: [Int]) -> Set<Int> {
    return Set(arrayInput)
}

removeDuplicateWithSet(arrayOfNum)
