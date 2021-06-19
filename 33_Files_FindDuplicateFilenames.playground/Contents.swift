import UIKit

//Challenge 33: Find duplicate filenames
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that accepts the name of a directory to scan, and returns an array of filenames that appear more than once in that directory or any of its subdirectories. Your function should scan all subdirectories, including subdirectories of subdirectories.
 Sample input and output
 • If directory/subdir/a.txt exists and directory/sub/sub/sub/sub/subdir/a.txt exists, “a.txt” should be in the array you return.
 • Ignore directories that have the same name; you care only about files. • If there are no files with duplicate names, return an empty array.
 
 Hints
 Hint #1: There are several ways of solving this, but most people instinctively reach for recursion to allow them to scan any depth of directory structure.
 Hint #2: FileManager has better solutions, though – take some time to explore!
 Hint #3: FileManager has an uncomfortable relationship between using String and URL for its data types. You should prefer the latter wherever possible, however your return value needs to be [String] because you care about duplicate names not paths.
 Hint #4: If you can’t read the directory that was requested, returning an empty array seems like a sensible thing to do.
 */


//==============================================================================================================================
//Solution by By Paul Hudson

/*
 It’s entirely possible you solved this challenge using a recursive function: return a list of all files in the current directory, along with the result of calling the function again on each subdirectory. That takes a little thinking, but it’s an acceptable solution to this challenge.
 There is, however, a better solution: FileManager can perform a deep search of directories for you. The best way to do this is with a directory enumerator, which you create like this:
 You can then loop over that enumerator and either get back a URL that points to a subdirectory or file, or you’ll get back nil. The enumerator will automatically recurse into every subdirectory (and every sub-subdirectory, and so on), which takes care of most of this challenge for you.
 One small fly in the ointment: looping over the iterator needs to be typecast to URL, so we’ll be writing this:
 for case let file as URL in files {
 There are two things that remain. First, eliminating directories: we don’t care if there are ten subdirectories called “test”, we only care about duplicate filenames. So, whenever we’re handed a URL that is a directory we are going to ignore it like this:
 guard file.hasDirectoryPath == false else { continue }
 The second remaining part of the challenge is to track duplicate filenames. We can solve this using two sets: one to track all filenames we’ve seen already, and one to track filenames that have been seen more than once. The challenge doesn’t mention whether the return value should list duplicate filenames only once, but clearly it’s more useful to do so, hence why I’m using a set.
 Recursion is always going to be necessary, but it’s nice to have iOS do it for us!
 Here’s my solution in full:
 */

func challenge33(in directory: String) -> [String] {
    let fm = FileManager.default
    let directoryURL = URL(fileURLWithPath: directory)
    guard let files = fm.enumerator(at: directoryURL, includingPropertiesForKeys: nil) else { return [] }
    var duplicates = Set<String>()
    var seen = Set<String>()
    for case let file as URL in files {
        guard file.hasDirectoryPath == false else { continue }
        let filename = file.lastPathComponent
        if seen.contains(filename) { duplicates.insert(filename)
        }
        seen.insert(filename) }
    return Array(duplicates)
}
