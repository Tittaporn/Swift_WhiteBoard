import UIKit

//Challenge 16: Fizz Buzz
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that counts from 1 through 100, and prints “Fizz” if the counter is evenly divisible by 3, “Buzz” if it’s evenly divisible by 5, “Fizz Buzz” if it’s even divisible by three and five, or the counter number for all other cases.
 
 Sample input and output
 • 1 should print “1”
 • 2 should print “2”
 • 3 should print “Fizz”
 • 4 should print “4”
 • 5 should print “Buzz”
 • 15 should print “Fizz Buzz”
 */

func fizzBuzz() {
    for number in 1...100 {
        if number % 3 == 0 && number % 5 == 0 {
            print("Fizz Buzz")
        } else if number % 3 == 0 {
            print("Fizz")
        } else if number % 5 == 0 {
            print("Buzz")
        } else {
            print(number)
        }
    }
}

fizzBuzz()

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 This is the holotype of interview questions, so it was inevitable it would be in here somewhere. Sadly, people really do fail it – I’ve seen it myself – which ought to be impossible, so I hope you didn’t just skip by blithely!
 A simple solution looks like this:
 */

func challenge16a() {
    for i in 1...100 {
        if i % 3 == 0 && i % 5 == 0 {
            print("Fizz Buzz")
        } else if i % 3 == 0 {
            print("Fizz")
        } else if i % 5 == 0 {
            print("Buzz")
      } else {
         print(i)
      }
    }
}

/*
You could make it slightly more efficient by nesting the “Fizz Buzz” case inside two if statements rather than one:
 */

func challenge16b() {
    for i in 1...100 {
        if i % 3 == 0 {
            if i % 5 == 0 {
                print("Fizz Buzz")
            } else {
                print("Fizz")
            }
        } else if i % 5 == 0 {
            print("Buzz")
        } else {
            print(i)
        }
    }
}

/*Using this approach, you don’t end up evaluating i % 3 twice.
You could be a bit more fancy using forEach and ternary operators, but you’re basically
sacrificing readability for smugness:
 */

func challenge16c() {
    (1...100).forEach {
        print($0 % 3 == 0 ? $0 % 5 == 0 ? "Fizz Buzz" : "Fizz" : $0 % 5 == 0 ? "Buzz" : "\($0)")
    }
}

/*
Note that I used "\($0)" rather than String($0) – this is a pet hate of mine, but that code is so complex that Swift actually fails to compile if I used String($0)!
 */
