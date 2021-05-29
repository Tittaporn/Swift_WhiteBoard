import UIKit

//Challenge 26: Subtract Without Subtract
//Swift Coding Challenges By Paul Hudson

/*
 Create a function that subtracts one positive integer from another, without using -.
 
 Sample input and output
 • The code challenge26(subtract: 5, from: 9) should return 4.
 • The code challenge26(subtract: 10, from: 30) should return 20.
 */

func subtractWithoutSubtract(subtract: Int, from: Int) -> Int {
   return from + -subtract
}

subtractWithoutSubtract(subtract: 5, from: 9)
subtractWithoutSubtract(subtract: 10, from: 30)
//==============================================================================================================================
//Solution by By Paul Hudson

/*
 This question is looking for a basic grasp of mathematics: if you can’t subtract one number from another using -, how can you do it? The answer is, of course, to flipping the sign on the number then adding it – i.e., rather than subtracting 10, you add -10.
 You could make an argument that flipping the sign on a number using - is different to using - for subtraction. That would give you a solution like this:
 */

func challenge26a(subtract: Int, from: Int) -> Int {
    return from + -subtract
}

/*
Technically, though, - in that instance is the unary minus operator, so it’s the same thing, really.
A solution that fits the spirit of the challenge a bit better is multiplying by -1, like this:
*/

func challenge26b(subtract: Int, from: Int) -> Int { return
    from + -1 * subtract
}

/*
 That’s a negative number, not the unary minus operator, so that fits both the letter and spirit of the challenge.
 However, for maximum effect, you can solve this challenge without typing - at all – well, excluding the -> used in declaring the function’s return value.
 This technique depends on the ~ operator (a tilde), which is bitwise NOT. It causes all the binary digits in a number to be flipped. If this is not new to you, skip ahead – I’m going to take a brief tangent into what it does behind the scenes.
 8-bit integers are stored using eight binary digits, where the right-most digit stores 1, the second right-most stores 2, then 4, 8, 16, 32, and 64. Depending on whether each of those binary digits are 1 or 0, Swift can represent numbers from 0 (all zeros) to 127 (all 1s). However, notice there are only seven of them – 1, 2, 4, 8, 16, 32, and 64 – and we’re talking about 8-bit integers, so there ought to be 8, right? Right.
 That eighth digit is how we track whether a number is positive or negative. If the left-most digit is 0, all the digits on the right add up to a positive number. If the left-most digit is 1, all the digits on the right represent a negative number.
 Here are some examples of positive numbers:
 • 00000000 is 0
 • 00000001 is 1
 • 00000010 is 2
 • 00000011 is 3
 • 00000100 is 4
 • 00000101 is 5
 • 01000000 is 64
 • 01111111 is 127
 So, as long as that first digit is 0, the rest of the digits form a positive number.
 Things are a little tricksier when you use negative numbers. Whereas the highest positive number starts with a zero and is followed by all ones, the lowest negative number starts with a one and is followed by all zeros – it’s the exact opposite.
 So:
 • 00000000 is still 0
 • 10000000 is -128
 • 10000001 is -127
 • 10000010 is -126
 • 10000011 is -125
 • 10000100 is -124
 • 10000101 is -123
 • 11000000 is -64
 • 11111111 is -1
 Now, all this becomes important when you flip the 1s and 0s. For example, 01000000 is 64, but if you make the 0s into 1s and the 1s into 0s you get 10111111, which is -65. Similarly, if you take 01010101, which is 85, and flip the bits, you get 10101010, which is -86.
 Both times the negative number is identical to add one to the number and flipping its sign, i.e. making positive negative. And that’s where our solution comes in – check this out:
 */

func challenge26c(subtract: Int, from: Int) -> Int { return
    from + (~subtract + 1)
}

/*
 
 So, to subtract one number from another, we flip the bits (64 becomes -65) then add one (to make -64), and add that to our input number to make subtraction. Done!
 */
