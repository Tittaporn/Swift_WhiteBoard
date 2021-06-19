import UIKit

//Challenge 30: New JPEGs
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that accepts a path to a directory and returns an array of all JPEGs that have
 been created in the last 48 hours.
 Tip #1: For the purpose of this task, just looking for “.jpg” and “.jpeg” file extensions is sufficient.
 Tip #2: For this challenge, assume time is regular and constant, i.e. the user has not changed their timezone or moved into or out from daylight savings.
 Tip #3: Use the terminal command touch -t YYYYMMDDHHMM somefile.jpg to adjust the creation time of a file, e.g. touch -t 201612250101.
 
 Sample input and output
 • If your directory contains three JPEGs older than 48 hours and three newer, your function should return the names of the three newer.
 */



//==============================================================================================================================
//Solution by By Paul Hudson

/*
 This challenge tests two things at once: do you feel comfortable working with files, and do you know how to create and compare dates? Neither of these are difficult, but they can show a lack of experience if you’re hit with a question like this during an interview.
 There are three parts to solving this challenge:
 1. Getting all files in the target directory, using the contentsOfDirectory() method on FileManager.
 2. Filtering by JPEGs. The challenge statement makes it clear that just filtering on the path extension of JPEG and JPG is sufficient, so you can just check the pathExtension property of each file.
 3. Filtering by creation date, ensuring that only newer JPEGs are included.
 That last part is the most complicated part of this problem, but even then it’s not too hard. You can read all properties of a file, then pull out specifically its creation date, like this:
 Once you have the file’s creation date, you can filter on files created after 48 hours ago by creating a new Date with the timeIntervalSinceNow initializer, passing in -60 * 60 * 48 – i.e., 60 seconds * 60 minutes * 48 hours, with the minus in there to send it backwards in time from now:
 if creationDate > Date(timeIntervalSinceNow: -60 * 60 * 48) { Once you definitely have a valid file, you’ll need to add it to an array then return that at the
 end of your function.
 Here’s my solution:
 */
func challenge30(in directory: String) -> [String] {
    let fm = FileManager.default
    let directoryURL = URL(fileURLWithPath: directory)
    guard let files = try? fm.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else { return [] }
    var jpegs = [String]()
    for file in files {
        if file.pathExtension == "jpg" || file.pathExtension ==
            "jpeg" {
            guard let attributes = try?
                    fm.attributesOfItem(atPath: file.path) else { continue }
            guard let creationDate = attributes[.creationDate] as?
                    Date else { continue }
            if creationDate > Date(timeIntervalSinceNow: -60 * 60 * 48) {
                jpegs.append(file.lastPathComponent)
            }
        }
    }
    return jpegs
}



