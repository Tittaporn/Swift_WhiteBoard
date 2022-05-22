import UIKit

var str = "Hello, playground"

func maskify(_ string:String) -> String {
  var markedOnString = ""
  let count = string.count
print(count)

  return ""
}

maskify(str)

/*
 maskify("4556364607935616") // should return "############5616"
 maskify("64607935616")      // should return "#######5616"
 maskify("1")                // should return "1"
 maskify("")                 // should return ""

 // "What was the name of your first pet?"
 maskify("Skippy")                                   // should return "##ippy"
 maskify("Nananananananananananananananana Batman!") // should return "####################################man!"
 */
