import UIKit

//Challenge 27: Print Last Lines
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that accepts a filename on disk, then prints its last N lines in reverse order, all on a single line separated by commas.
 
 Sample input and output
 Here is your test input file:
 Antony And Cleopatra
 Coriolanus
 Cymbeline
 Hamlet
 Julius Caesar
 King Lear
 Macbeth
 Othello
 Twelfth Night
 
 • If asked to print the last 3 lines, your code should output “Twelfth Night, Othello, Macbeth”.
 • If asked to print the last 100 lines, your code should output “Twelfth Night, Othello, Macbeth, King Lear, Julius Caesar, Hamlet, Cymbeline, Coriolanus, Antony and Cleopatra”.
 • If asked to print the last 0 lines, your could should print nothing.
 */

var test = "Antony And Cleopatra \nCoriolanus \nCymbeline \nHamlet \nJulius Caesar \nKing Lear \nMacbeth \nOthello \nTwelfth Night"

func printLastLinesFrom(fileName: String, lineCount: Int) {
    guard let input = try? String(contentsOfFile: fileName) else {return}
    var lines = input.components(separatedBy: "\n")
    guard lines.count > 0 else {return}
    lines.reverse()
    var output = [String]()
    for i in 0..<min(lines.count, lineCount) {
        output.append(lines[i])
    }
    print(output.joined(separator: ", "))
}

printLastLinesFrom(fileName: "README.md", lineCount: 2)

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 This is a nice and simple challenge, and is the kind of thing you’ll hit in real-world coding all the time. Hopefully, then, you found it a breeze: use contentsOfFile to get a multiline String of text, use components(separatedBy: "\n") to split it into an array of lines, then reverse the array and loop over N items.
 In order to fully satisfy the challenge’s requirements – and to add safety to make sure we don’t read outside the array! – we also need to add a couple of guard statements to eliminate bad input, and use min() to pick the lowest number between the requested line count and the number of lines in the array.
 Here’s the code:
 */

func challenge27(filename: String, lineCount: Int) {
    guard let input = try? String(contentsOfFile: filename) else { return }
    var lines = input.components(separatedBy: "\n")
    guard lines.count > 0 else { return }
    lines.reverse()
    var output = [String]()
    for i in 0 ..< min(lines.count, lineCount) {
        output.append(lines[i])
    }
    print(output.joined(separator: ", "))
}

challenge27(filename: "example", lineCount: 2)


