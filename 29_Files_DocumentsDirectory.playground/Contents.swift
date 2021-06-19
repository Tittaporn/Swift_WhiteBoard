import UIKit

//Challenge 29: Document Directory
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that returns a URL to the user’s documents directory.
 
 Sample input and output
 • Your function should need no input, and return a URL pointing to /Users/yourUserName/ Documents on macOS, and /path/to/container/Documents on iOS.
 */

func urlDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
   return paths[0]
}

urlDirectory()

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 This is the kind of question that gives coding interviews a bad rap: there’s no logic that you can figure out yourself, or any algorithm you might have learned in a class once. Instead, you either know the answer or you don’t, which is testing nothing other than your ability to memorize vast swathes of Cocoa Touch.
 There are three reasons I’m including it here. First, if you didn’t know how to do this, you do know now so you’ve learned something new. Second, it’s actually pretty easy to do once you know how, so you might as well get it under your belt in case you get hit with this question in the future. Third, this is useful code to have at hand: reading and writing to the user’s documents directory is very common on iOS, so you’ll almost certainly use this code in real projects.
 Here’s my solution:
 */

func challenge29() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
   return paths[0]
}

challenge29()

/*
 Like I said in the hints, though: if you get asked this during an interview, I’d be tempted to answer that it’s something trivial enough to be looked up online. I’m no fan of coding by Stack Overflow, and if someone said “I don’t know much about UITableView but I could look it up” then I’d not think highly of their skills, but this particular problem is something so simple that it really is just a Google search away if you need it.
 */


