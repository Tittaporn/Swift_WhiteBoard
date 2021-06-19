import UIKit

/*
 so i had a final interview today that lasted about 5 hours with 3 separate hours of coding challenges and got this one at the end...

 Generate all possible valid IP addresses from given string
  
  Input: 25525511135
  Output: [“255.255.11.135”, “255.255.111.35”]
  Explanation:
  These are the only valid possible
  IP addresses.

  Input: "25505011535"
  Output: []
  Explanation: We cannot generate a valid IP address with this string.
 
 A valid IP address must be in the form of A.B.C.D, where A,B,C and D are numbers from 0-255. The numbers cannot be 0 prefixed unless they are 0.
 */

//BenT — 05/29/2021
func validAddresses(input: String) -> [String] {
    let count = input.count
    let array = Array(input)
    print(count)
        
    var addresses: [String] = []
    
    var a = 3
    var b = 6
    var c = 9
    
    switch count {
    case 4:
        a = 1; b = 2; c = 3
    case 5:
        a = 2; b = 3; c = 4
    case 6:
        a = 3; b = 4; c = 5
    case 7:
        a = 3; b = 5; c = 6
    case 8:
        a = 3; b = 6; c = 7
    case 9:
        a = 3; b = 6; c = 8
    default:
        a = 3; b = 6; c = 9
    }
    
    for i in 0..<a {
        for j in (i+1)..<b {
            for k in (j+1)..<c {
                var arr: [String] = []
                
                let one = String(array[0...i])
                let two = String(array[(i+1)...j])
                let three = String(array[(j+1)...k])
                let four = String(array[(k+1)...])
                
                arr.append(one)
                arr.append(two)
                arr.append(three)
                arr.append(four)
                
                var invalid = false
                
                for valueString in arr {
                    let value = Int(valueString)
                    
                    if valueString.count > 1 && valueString.first == "0" {
                        invalid = true
                    } else if let value = value, value > 255 {
                        invalid = true
                    }
                }
                
                if invalid { continue }
    
                let str = "\(one).\(two).\(three).\(four)."
                addresses.append(str)
            }
        }
    }
    return addresses
}

validAddresses(input: "25525511135")
