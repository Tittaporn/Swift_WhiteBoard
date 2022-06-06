import UIKit

var greeting = "Hello, Threads and Grand Central Dispatch in Swift"
func printLine(_ info: String) {
    print("\n-------------------------- \(info) --------------------------\n")
}

printLine(greeting)

//----------------------------------------------------------------------------------
printLine("sync")
DispatchQueue.global().sync {
    print("\(Date()) | sync : Inside Before Sleep")
    sleep(2)
    print("\(Date()) | sync : Inside After Sleep")
}
print("\(Date()) | sync : Outside")

//----------------------------------------------------------------------------------
printLine("async")
DispatchQueue.global().async {
    print("\(Date()) | async : Inside Before Sleep")
    sleep(2)
    print("\(Date()) | async : Inside After Sleep")
}
print("\(Date()) | async : Outside")

//----------------------------------------------------------------------------------
printLine("asyncAfter")
DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(5)) {
    print("\(Date()) | asyncAfter : First delay for 5 seconds")
}

//----------------------------------------------------------------------------------
printLine("asyncAfterShortSyntex")
DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    print("\(Date()) | asyncAfterShortSyntex : Delayed by 2 seconds")
}

//----------------------------------------------------------------------------------
printLine("Log")
extension DispatchQueue {
    static func log(action: String) {
        print("""
            \(action)
            👫 \(String(validatingUTF8: __dispatch_queue_get_label(nil))!)
            🧵 \(Thread.current)
            """)
    }
}

enum Log {
    static func queue(action: String) {
        DispatchQueue.log(action: action)
    }
    
    static func location( fileName: String,
                          functionName: String = #function,
                          lineNumber: Int = #line) {
        
        print("Called by \(fileName.components(separatedBy: "/").last ?? fileName) - \(functionName) at line \(lineNumber)")
    }
}

DispatchQueue.global(qos: .userInteractive).async {
    Log.queue(action: "Test Log")
    print("\(Date()) | global(qos: .userInteractive).async : Test Log")
    
    DispatchQueue.main.async {
        Log.queue(action: "Test Log")
        print("\(Date()) | main.async : Test Log")
    }
}

//----------------------------------------------------------------------------------
printLine("DispatchGroup")
let globalQueue = DispatchQueue.global()
let group = DispatchGroup()

globalQueue.async(group: group) {
    sleep(3)
    print("\(Date()) | globalQueue.async - group : Task 1 done - Test DispatchGroup")
}

globalQueue.async(group: group) {
    sleep(1)
    print("\(Date()) | globalQueue.async - group : Task 2 done - Test DispatchGroup")
}

group.wait()
print("\(Date()) | globalQueue.async - group : All tasks done - Test DispatchGroup")
print("\(Date()) | globalQueue.async - group : Continute Execution - Test DispatchGroup")

//----------------------------------------------------------------------------------
printLine("DispatchGroup Enter and Leave")
let globalQueueEnterAndLeave = DispatchQueue.global()
let groupEnterAndLeave = DispatchGroup()

groupEnterAndLeave.enter()
globalQueueEnterAndLeave.async(group: groupEnterAndLeave) {
    sleep(3)
    print("\(Date()) | globalQueueEnterAndLeave - group : Task 1 done - Test DispatchGroup")
    groupEnterAndLeave.leave()
}

groupEnterAndLeave.enter()
globalQueueEnterAndLeave.async(group: groupEnterAndLeave) {
    sleep(1)
    print("\(Date()) | globalQueueEnterAndLeave - group : Task 2 done - Test DispatchGroup")
    groupEnterAndLeave.leave()
}

groupEnterAndLeave.notify(queue: globalQueueEnterAndLeave) {
    print("\(Date()) | globalQueueEnterAndLeave - group : All tasks done - Test DispatchGroup")
}
print("\(Date()) | globalQueueEnterAndLeave - group : Continute Execution - Test DispatchGroup") // This one printing first..

//----------------------------------------------------------------------------------
printLine("Serial VS Concurrent")

let serialQueue = DispatchQueue(label: "serial.test.queue") // By Default the queue is serial queue ==> FIFO, execute one task at a time

serialQueue.async {
    print("\(Date()) |  Serial : Task 1 Started")
    print("\(Date()) |  Serial : Task 1 Ended")
}

serialQueue.async {
    print("\(Date()) |  Serial : Task 2 Started")
    print("\(Date()) |  Serial : Task 2 Ended")
}


let concurrentQueue = DispatchQueue(label: "concurrent.test.queue", attributes: .concurrent) // Execute so many tasks at the same time

concurrentQueue.async {
    print("\(Date()) |  Concurrent async: Task 1 Started")
    print("\(Date()) |  Concurrent async: Task 1 Ended")
}

concurrentQueue.async {
    print("\(Date()) |  Concurrent async: Task 2 Started")
    print("\(Date()) |  Concurrent async: Task 2 Ended")
}

//----------------------------------------------------------------------------------
printLine("sync VS async") // sync == same output of serialQueue
concurrentQueue.sync {
    print("\(Date()) |  Concurrent sync: Task 1 Started")
    print("\(Date()) |  Concurrent sync: Task 1 Ended")
}

concurrentQueue.sync {
    print("\(Date()) |  Concurrent sync: Task 2 Started")
    print("\(Date()) |  Concurrent sync: Task 2 Ended")
}

//----------------------------------------------------------------------------------
printLine("Concurrency in Swift : What will the print order be?") // Only print 1

Log.queue(action: "Test serialQueue : DispatchQueue")
serialQueue.async {
    print("\(Date()) |  What will the print order be? : 1")
    serialQueue.sync {
        print("\(Date()) |  What will the print order be? : 2")
        serialQueue.async {
            print("\(Date()) |  What will the print order be? : 3")
        }
    }
}

serialQueue.async {
    print("\(Date()) |  What will the print order be? : 4")
}

serialQueue.async {
    print("\(Date()) |  What will the print order be? : 5")
}

//----------------------------------------------------------------------------------
/* Souces :
https://www.youtube.com/watch?v=uRLcV2Rvheg
https://www.youtube.com/watch?v=tVJqvPg5i6M
https://cocoacasts.com/swift-and-cocoa-fundamentals-threads-queues-and-concurrency
https://medium.com/@prasanna.aithal/multi-threading-in-ios-using-swift-82f3601f171c
https://www.hackingwithswift.com/quick-start/concurrency/understanding-threads-and-queues
https://www.hackingwithswift.com/quick-start/concurrency/main-thread-and-main-queue-whats-the-difference
 */
