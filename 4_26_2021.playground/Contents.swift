import UIKit

// 04/26/2021 Audio

var input2DArray = [[1,2,4],[56,77,89],[5,6,99,65]]

func findIndicesOf(x: Int, array: [[Int]]) -> [Int] {
    var returnArray:[Int] = []
    for i in 0..<array.count {
        for j in 0..<array[i].count {
            if array[i][j] == x {
                returnArray.append(i)
                returnArray.append(j)
            }
        }
    }
   return returnArray
}

findIndicesOf(x: 99, array: input2DArray)
// Time Complexity: O(n²) — Quadratic Time
// Space Complexity: O(n) – linear complexity ???

//===============================================================================================

var arrayInput = [6,6,6,6,4,3,3,4,4]
//output : 6

func findOddOccurrency(arrayInput: [Int]) -> Int? {
    var dict: [Int:Int] = [:]
    for a in arrayInput {
        if let count = dict[a] {
            dict[a] = count + 1
        } else {
            dict[a] = 1
        }
    }
    
    var numberOfOddOccurrency: Int?
    for (number, count) in dict {
        if count % 2 != 0 {
            numberOfOddOccurrency = number
        }
    }
    return numberOfOddOccurrency
}

// Time Complexity:  Linear == O(n)
// Space Complexity: ??

findOddOccurrency(arrayInput: arrayInput)

//===============================================================================================

//https://www.youtube.com/watch?v=0eWv1mAewx4
//Most Common Element in Array - Swift Tutorial - iOS Interview Coding Challenge by Sean Allen

var colorArray = ["red","green","blue","green","green","green","green","green","green","red","green","blue","red","green","blue","red","green","blue","red","green","blue","red","green","blue","red","green","blue","red","green","blue","red","green","blue","red","green","blue","red","green","blue","red","green","blue","red","green","blue","blue","blue","blue","blue","blue","blue","blue","red","red","red","red","red","red","red","red"]

func findMostCommonColor(arrayOfColor: [String]) -> [String] {
    var colorDict: [String:Int] = [:]
    for color in arrayOfColor {
        if let count = colorDict[color] {
            colorDict[color] = count + 1
        } else {
            colorDict[color] = 1
        }
    }
    var mostCommonColors: [String] = []
    let highValue = colorDict.values.max()
    for (color,count) in colorDict {
        if count == highValue {
            mostCommonColors.append(color)
        }
    }
    return mostCommonColors
}

findMostCommonColor(arrayOfColor: colorArray)

//===============================================================================================

/*
 
 // Here is the solution from stackOverflow For find indices of 2DArray
 
func indicesOf<T: Equatable>(x: T, array: [[T]]) -> (Int, Int)? {
    for (i, row) in array.enumerate() {
        if let j = row.indexOf(x) {
            return (i, j)
        }
    }
    return nil
}
 
 extension Array where Element : CollectionType,
     Element.Generator.Element : Equatable, Element.Index == Int {
     func indicesOf(x: Element.Generator.Element) -> (Int, Int)? {
         for (i, row) in self.enumerate() {
             if let j = row.indexOf(x) {
                 return (i, j)
             }
         }
         return nil
     }
 }

 if let (i, j) = a.indicesOf(7) {
     print(i, j)
 }
 
*/

//===============================================================================================
