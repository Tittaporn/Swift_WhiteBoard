import UIKit

//Challenge 31: Copy Recursively
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that accepts two paths: the first should point to a directory to copy, and the second should be where the directory should be copied to. Return true if the directory and all its contents were copied successfully; false if the copy failed, or the user specified something other than a directory.
 Sample input and output
 • If your directory exists and is readable, the destination is writeable, and the copy succeeded, your function should return true.
 • Under all other circumstances you should return false: if the directory does not exist or was not readable, if the destination was not writeable, if a file was specified rather than a directory, or if the copy failed for any other reason.
 */


//==============================================================================================================================
//Solution by By Paul Hudson

/*
 On its surface this challenge needs you to know a little about the filesystem in Swift, in particular how much work FileManager can do for you.
 However, you soon get hit with a cunning complexity: the fileExists() method returns true or false depending on whether the item exists, or also has an optional inout parameter that tells you whether the item was a directory. Cunningly, that inout parameter needs to be of type ObjCBool, which is like a regular boolean except that it’s completely different and incompatible. Yay.
 Fortunately, you can create an ObjCBool like this: var isDirectory: ObjCBool = false
 Once you pass that into fileExists(), it will be set to a new value that reflects the actual item you queried. You can then check whether it’s a directory by reading the boolValue property of your ObjCBool, like this:
 Now that you’ve checked the directory exists and that it is actually a directory, you can get onto the meat of this problem: copying it somewhere else. This is as simple as calling the copyItem() method of FileManager, although you will need to wrap it inside do/catch so you can catch any errors and return false, as the challenge requested.
 Here’s my solution:
 */

func challenge31(source: String, destination: String) -> Bool {
    let fm = FileManager.default
    var isDirectory: ObjCBool = false
    guard fm.fileExists(atPath: source, isDirectory: &isDirectory) || isDirectory.boolValue == false else {return false }
    let sourceURL = URL(fileURLWithPath: source)
    let destinationURL = URL(fileURLWithPath: destination)
    do {
        try fm.copyItem(at: sourceURL, to: destinationURL)
    } catch {
        print("Copy failed: \(error.localizedDescription)")
        return false
    }
    return true
}
