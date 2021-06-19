import UIKit

//Challenge 36: Print Error Lines
//Swift Coding Challenges By Paul Hudson

/*
 Write a function that accepts accepts a path to a log file on disk, and returns how many lines
 start with “[ERROR]”. The log file could be as large as 10GB, but may also not exist.
 Sample input and output
 • If the file contains 100,000,000 lines and eight start with “[ERROR]” your function should return 8.
 • If the file does not exist, cannot be loaded, or contains zero lines starting with “[ERROR]” your function should return 0.
 Hints
 Hint #1: You can use the contentsOfFile initializer for strings, but only if you want to be laughed out of the room.
 Hint #2: This is a job for FileHandle, which opens a file and reads chunks of a size you specify using readData(ofLength:).
 Hint #3: FileHandle doesn’t care about line breaks, so it will read as much data as you ask. It’s down to you to use range(of:) to find zero or more line breaks inside the chunk you read.
 Hint #4: To make things neater, I created a custom class to store my file reading code – you might want to consider doing the same.
 */

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 This is a challenge that ought to be easy, but sadly is far harder than you think because Swift doesn’t have any neat APIs for streaming data. A number of brave people have stepped up to try to create third-party components, not least Dave DeLong with his Objective-C DDFileReader component, but clearly it wouldn’t be a great answer to this question if you just pulled in a third-party component!
 So, instead I want to show you a solution that is a lot simpler. I took the structure of Dave’s DDFileReader, converted it to Swift, stripped out everything that wasn’t essential, then refactored what remained to make it as simple as possible. I’m afraid even then it’s not simple enough to remember, but hopefully you can at least see the structure of the solution and that might be enough to help you recreate it if needed.
 Here’s how the code works:
 1. It’s a new class called ChunkedFileReader that is responsible for opening a file and reading lines until the end of the file is reached.
 2. I’ve made it read lines 4 characters at a time (chunkSize), which is an absurdly small amount in production, but great as a test so you can step through it at runtime to see how it works. (A chunk size of between 1024 and 8192 bytes would be more sensible for production.)
 3. You initialize the class by passing it a filename. It then creates a buffer, which is what it reads the file into over time.
 4. Every time you call its readLine() method, it attempts to find the next line break. It does this by reading chunkSize bytes into its buffer and scanning for the delimiter “\n”.
 5. If no line break is found, it keeps reading chunks and placing them into the buffer.
 6. Eventually, either a line break is found or the file ends. Either way, if the buffer has data
 inside it gets converted into a string and sent back.
 I used “\n” for the delimiter – the marker for where lines end – which suits this challenge nicely.
 Here’s my ChunkedFileReader class, with inline comments:
 */
class ChunkedFileReader {
    var fileHandle: FileHandle?
    // we keep adding to the buffer until eventually we find a line break or hit the end of the file
    var buffer: Data
    // this should be between 1024 and 8192 for production; it determines how much of the file is read in each step
    let chunkSize: Int = 4
    // this determines what we consider to be an end of line
    let delimiter = "\n".data(using: .utf8)!
    init(path: String) {
        // open the file handle and prepare the buffer fileHandle = FileHandle(forReadingAtPath: path) buffer = Data(capacity: chunkSize)
    }
    func readLine() -> String? {
        // find the delimiter in our buffer
        var rangeOfDelimiter = buffer.range(of: delimiter)
        // loop until we finally find a delimiter
        while rangeOfDelimiter == nil {
            // try to read a chunk from the file handle, or bail out if it didn't work
            guard let chunk = fileHandle?.readData(ofLength: chunkSize) else { return nil }
            if chunk.count == 0 {
                // the chunk was read successfully, but was empty – we reached the end of the file back, and make finished
                if buffer.count > 0 {
                    // the buffer has something left in it; send it sure to clear the buffer's remnants when it's
                    defer { buffer.count = 0 }
                    return String(data: buffer, encoding: .utf8) }
                // we reached the end of the file and the buffer was empty; send back nil
                return nil
            } else {
                // we read some data; append it to our buffer
                buffer.append(chunk)
                // now re-scan for the delimiter
                rangeOfDelimiter = buffer.range(of: delimiter) }
        }
        // we can only make it here if we found a delimiter, but it might be anywhere inside our buffer; we want to pull out everything in our buffer from the start up to where the delimiter lies
        let rangeOfLine = Range(0 ..< rangeOfDelimiter!.upperBound)
        // convert that range of our buffer into a string
        let line = String(data: buffer.subdata(in: rangeOfLine), encoding: .utf8)
        // then remove it from the buffer
        buffer.removeSubrange(rangeOfLine)
        // send the line back, removing the trailing line break at the end.
        line?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}


/*
 So: it reads in chunk after chunk from the file until it eventually finds a line break, at which point it pulls out everything from the start of the buffer up to the line break and returns it as a line. The remainder of the buffer stays in place, waiting for the next readLine() call.
 Of course, all that doesn’t actually satisfy the challenge that was set, it just puts the foundations in place. And in fact it does nearly all the work, so all that remains is to create a new ChunkedFileReader instance and continually call its readLine() method and look for the string prefix “[ERROR”]:
 */

func challenge36(filename: String) -> Int { var totalErrors = 0
    let reader = ChunkedFileReader(path: filename)
    while let line = reader.readLine() { if line.hasPrefix("[ERROR]") {
        totalErrors += 1 }
    }
    return totalErrors
}

/*
 Done!
 It’s a real shame that this task – a fairly fundamental one, if you ask me – takes so much work. Perhaps Apple will add their own chunked file reader to the standard library in the future...
 */
