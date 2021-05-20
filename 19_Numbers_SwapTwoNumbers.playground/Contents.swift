import UIKit

//Challenge 19: Swap two numbers
//Swift Coding Challenges By Paul Hudson

/*
 Swap two positive variable integers, a and b, without using a temporary variable.

 Sample input and output
 • Before running your code a should be 1 and b should be 2; afterwards, b should be 1 and a should be 2.
 */

func swapTwoNumber(a: Int, b: Int) -> [Int] {
    return [b,a]
}

swapTwoNumber(a: 1, b: 2)
swapTwoNumber(a: 3, b: 4)

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 This is a favorite question of lazy interviewers – people who don’t want to spend an hour of life coming up with genuinely interesting, useful questions that explore real Swift knowledge. It used to be important in Ye Olde Days when every byte mattered, but in a world where Slack on macOS happily chews through 400MB of RAM just idling this test is more a curiosity than anything else.
 Still, this question does one have benefit, which is that are idiomatic solutions for Swift developers – i.e., Swifty ways to solve it.
 Let’s look at the basic solution first, which looks like this:
 
a = a+b
b = a-b
a = a-b
 
 That’s the solution you’d use in most languages, and it works fine. If you’re feeling smart, you can also use XOR like this:
 
 a = a^b
 b = a^b
 a = a^b
 
 I think that solution is fractionally easier to remember, because it uses the same operator all three times.
 So, those are the standard solutions, but Swift gives us two alternatives. First, there’s a global swap() function that swaps two values of the same type, like this:
 
 swap(&a, &b)
 
 The swap() function is micro-optimized to be as fast as possible, so you’ll see it used extensively in sorting algorithms.
 A second idiomatic solution is to use tuples. This delivers a beautifully simple solution to the challenge that is also undeniably Swifty:
 
 (a, b) = (b, a)
 
 Marvelous.
 */
