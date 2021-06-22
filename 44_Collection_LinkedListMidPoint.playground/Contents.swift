import UIKit

//Challenge 44: Linked List Mid-Point
//Swift Coding Challenges By Paul Hudson

/*
 Extend your linked list class with a new method that returns the node at the mid point of the
 linked list using no more than one loop.
 Tip: If the linked list contains an even number of items, returning the one before or the one after the center is acceptable.
 Sample input and output
 • If the linked list contains 1, 2, 3, 4, 5, your method should return 3.
 • If the linked list contains 1, 2, 3, 4, your method may return 2 or 3.
 • If the linked list contains the English alphabet, your method may return M or N.
 
 Hints
 Hint #1: It’s easy to solve this in two passes, but only fractionally harder to solve it in one. Hint #2: If you use fast enumeration – for i in items – you move over one item at a time. Can
 you think of a way of moving over more than one item?
 Hint #3: Once you pull out two items at the same time, you can make them move at different speeds through the list.
 Hint #4: If you move pointer A through the list one item at a time, and pointer B through the list two items at a time, by the time pointer B reaches the end where will pointer A be?
 */

class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    init(value:T) {
        self.value = value
    }
}

class LinkedList<T> {
    var start: LinkedListNode<T>?
    var centerNode: LinkedListNode<T>? {
        var slow = start
        var fast = start
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
    
    func printNode() {
        var currentNode = start
        while let node = currentNode {
            print(node.value, terminator: " ")
            currentNode = node.next
        }
    }
}

var list = LinkedList<Character>()
var previousNode: LinkedListNode<Character>? = nil
for letter in "abcdefghijklmnopqrstuvwxyz" {
    let node = LinkedListNode(value: letter)
    if let predecessor = previousNode {
        predecessor.next = node
    } else {
        list.start = node
    }
    previousNode = node
}
list.printNode()
list.centerNode?.value

var listNum = LinkedList<Int>()
var previousNodeNum: LinkedListNode<Int>? = nil
let arrayNum = [1,2,3,4,5]
for num in arrayNum {
    let nodeNum = LinkedListNode(value: num)
    if let prodecessor = previousNodeNum {
        prodecessor.next = nodeNum
    } else {
        listNum.start = nodeNum
    }
    previousNodeNum = nodeNum
}
listNum.printNode()
listNum.centerNode?.value

var listNum0 = LinkedList<Int>()
var previousNodeNum0: LinkedListNode<Int>? = nil
let arrayNum0 = [1,2,3,4]
for num in arrayNum0 {
    let nodeNum = LinkedListNode(value: num)
    if let prodecessor = previousNodeNum0 {
        prodecessor.next = nodeNum
    } else {
        listNum0.start = nodeNum
    }
    previousNodeNum0 = nodeNum
}
listNum0.printNode()
listNum0.centerNode?.value

    //==============================================================================================================================
    //Solution by By Paul Hudson
    
    /*
     Moving through collections at different speeds is a useful way to solve many problems, including this one and another coming soon.
     In this case, the clue is in the challenge description: we aren’t allowed to use more than one loop, so we have no way of knowing where the middle of the loop is unless we look ahead. Fortunately, the end of the linked list is more or less twice as far as the half-way point – that’s obvious when you think about it, although it is more or less because even-numbered lists don’t have a precise center.
     So, to find the center of a linked list we need to create two pointers: a slow-moving one and a fast-moving one. We can then start our loop: for as long as the fast pointer is not nil, and its next node is also not nil, we’ll move it forward two places. At the same time, we’ll move the slow pointer forward one. When the loop finishes – i.e., when either the fast pointer is nil or its next value is nil – we’ve reached the end, at which point the slow pointer contains our center point.
     Here’s my solution:
     */
    
    /*
    var centerNode: LinkedListNode<T>? {
        var slow = start
        var fast = start
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
*/
