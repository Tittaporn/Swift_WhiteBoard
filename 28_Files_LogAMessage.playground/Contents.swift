import UIKit

//Challenge 28: Log a message
//Swift Coding Challenges By Paul Hudson

/*
 Write a logging function that accepts accepts a path to a log file on disk as well as a new log message. Your function should open the log file (or create it if it does not already exist), then append the new message to the log along with the current time and date.

 Tip: It’s important that you add line breaks along with each message, otherwise the log will just become jumbled.

 Sample input and output

 If the file does not exist, running your function should create it and save the new message.
 If it does exist, running your function should load the existing content and append the message to the end, along with suitable line breaking.
 
 PS. I don't get this how it work on contentsOfFile by Lee McCormick
 */

func logAMessage(log message: String, to logFile: String) {
    var existingLog = (try? String(contentsOfFile: logFile)) ?? ""
    existingLog.append("\(Date()): \(message)\n")
    do {
        try existingLog.write(toFile: logFile, atomically: true, encoding: .utf8)
    } catch {
        print("Failed to write to log: \(error.localizedDescription)")
    }
}


//==============================================================================================================================
//Solution by By Paul Hudson

/*
 This is a small and contained challenge, but gives you just enough scope to demonstrate your Swift skills.

 Specifically, there are three areas where your solution is open for discussion:

 How you load the log file, or provide a default value if the log hasn’t been created yet.
 How you format dates to include in each log message.
 How you write the updated log file back to disk, handling any errors that might occur.
 The easiest way to solve the first is using one of my favorite Swift tips: combining try? with nil coalescing to provide a default value in cases where a thrown exception just means “missing value”. In code it looks like this:

 var existingLog = (try? String(contentsOfFile: logFile)) ?? ""
 After that line has run, existingLog will either be an empty string or the contents of the log file.

 There are lots of ways to solve the second, but honestly the smartest way is also the easiest: just using Date() inside string interpolation. That will cause the current date and time to be printed out as “Year-Month-Day Hour:Minute:Second”, which is ideal. So, you would write this:

 existingLog.append("\(Date()): \(message)\n")
 Finally, writing data to disk is a throwing function, so you need to decide what to do with any errors. You could ignore them, like this:

 _ = try? existingLog.write(toFile: logFile, atomically: true, encoding: .utf8)
 …but that’s probably not smart: failure to write log messages seems serious to me, so at the very least you will want to print a warning, like this:

 do {
     try existingLog.write(toFile: logFile, atomically: true, encoding: .utf8)
 } catch {
     print("Failed to write to log: \(error.localizedDescription)")
 }
 Another reasonable approach would be to do without do/catch, just use try by itself, then mark the whole function with throws and let the call site deal with it. Regardless of what you choose, it leaves some scope for interesting discussion, which is always a good thing.

 Here’s my complete solution to this challenge:

 */

func challenge28(log message: String, to logFile: String) {
    var existingLog = (try? String(contentsOfFile: logFile)) ?? ""
    existingLog.append("\(Date()): \(message)\n")
    do {
        try existingLog.write(toFile: logFile, atomically: true, encoding: .utf8)
    } catch {
        print("Failed to write to log: \(error.localizedDescription)")
    }
}

challenge28(log: "Lee", to: "Lee")
