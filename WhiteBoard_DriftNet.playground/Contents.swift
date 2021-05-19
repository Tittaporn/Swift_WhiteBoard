import UIKit

//May 2021
/*
 write a function solution that, given an integer N, returns the maximum possible value obtained by inserting one '5' digit inside the decimal representation of integer N
 
 Examples:
 1) Given N = 268, the function should return 5268
 2) Given N = 670, the function should return 6750
 3) Given N = 0, the function should return 50
 4) Given N = -999, the function should return -5999
 */

func maximumValueByInsertingFive(n: Int) -> Int {
    
    let nString = String(n)
    var intArray : [Int] = []
    
    for index in 0...nString.count {
        var newArray = nString.map {$0}
        newArray.insert("5", at: index)
        var newString = ""
        for n in newArray {
            newString += String(n)
        }
        intArray.append(Int(newString) ?? 0)
    }
    
    if let indexToDelete = intArray.firstIndex(of: 0) {
        intArray.remove(at: indexToDelete)
    }
    
    var maxValue: Int = intArray[0]
    for int in intArray {
        if int > maxValue {
            maxValue = int
        }
    }
    return maxValue
}

maximumValueByInsertingFive(n: 268)
maximumValueByInsertingFive(n: 670)
maximumValueByInsertingFive(n: 0)
maximumValueByInsertingFive(n: -999)
