import UIKit

//Challenge 34: Find Execulatables
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that accepts the name of a directory to scan, and returns an array containing
 the name of any executable files in there.
 Sample input and output
 • If directory/a exists and is executable, “a” should be in the array you return.
 • If directory/subdirectory/a exists and is executable, it should not be in the array you return;
 only return files in the directory itself, not its subdirectories. • If there are no executable files, return an empty array.
 Hints
 Hint #1: Make sure you create the test directories as shown in the sample input/output. You can use touch a to create a file called “a”, then chmod a+x a to mark it executable.
 Hint #2: You probably want to use the isExecutableFile() method of FileManager. Hint #3: If you don’t create at least one subdirectory to test with, your tests will be
 incomplete.
 Hint #4: Directories are considered executable for historical reasons. If they appear in your return array, you won’t have passed the challenge.
 */


//==============================================================================================================================
//Solution by By Paul Hudson

/*
 This is an easy challenge to fail if you didn’t bother to create the sample input and check that your code works as expected. Working with filesystems is always replete with gotchas, and this challenge is no different: if you thought you could just get a list of all the files in the directory and return those that are executable, your code won’t work properly because FileManager considers directories to be executable.
 The reason for this is historical: file permissions mean one thing when they are attached to files, and something else entirely when attached to directories. For files, executable permission means the file can be run, so it’s a script or a binary. However, for directories executable permission means the user can enter into the directory and access its contents.
 By default, all directories are considered executable, so you must explicitly filter out any directories you find. Once that’s done, you can use isExecutableFile() to check what remains.
 Here’s my solution:
 */

func challenge34(in directory: String) -> [String] { let fm = FileManager.default
    let directoryURL = URL(fileURLWithPath: directory)
    guard let files = try? fm.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else { return [] }
    var returnValue = [String]()
    for file in files {
        guard file.hasDirectoryPath == false else { continue }
        if fm.isExecutableFile(atPath: file.path) { returnValue.append(file.lastPathComponent)
        }
    }
    return returnValue
}
