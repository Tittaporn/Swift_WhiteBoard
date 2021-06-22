import UIKit

//Challenge 43: Linked Lists
//Swift Coding Challenges By Paul Hudson

/*
 Create a linked list of lowercase English alphabet letters, along with a method that traverses all
 nodes and prints their letters on a single line separated by spaces.
 
 Tip #1: This is several problems in one. First, create a linked list data structure, which itself is really two things. Second, use your linked list to create the alphabet. Third, write a method traverses all nodes and prints their letters.
 Tip #2: You should use a class for this. Yes, really.
 Tip #3: Once you complete your solution, keep a copy of the code – you’ll need it for future
 
 challenges!
 Sample input and output
 • The output of your code should be the English alphabet printed to the screen, i.e. “a b c d ... x y z”.
 
 Hints
 Hint #1: If your first instinct was to create your new data types as a struct, it shows you’re a sound Swift developer. Sadly, I’m afraid that approach won’t work here because structs can’t have stored properties that reference themselves.
 Hint #2: Your second instinct might be to use an enum. This makes creation tricksy because you would need to change the associated value after creating the enum.
 Hint #3: Even though this challenge uses alphabet letters, aim to make your class generic – it shows smart forward thinking, and is only fractionally harder than using a specific data type.
 Hint #4: There are lots of hacky ways to loop over the alphabet. The only sensible way is to use "abcdefghijklmnopqrstuvwxyz" – it’s not hard to write, is self-documenting, and quite safe.
 Hint #5: You should create two data types: one for a node, which contains its character and link to the next node in the list, and one for the overall linked list, which contains a property for the first node in the list as well as the print method.
 Hint #6: The print() function has a terminator parameter.
 */

class LinkListNodeByLee<T> {
    var value: T
    var next: LinkListNodeByLee?
    init(value: T){
        self.value = value
    }
}

class LinkListByLee<T> {
    var start: LinkListNodeByLee<T>?
    func printNode() {
        var currentNode = start
        while let node = currentNode {
            print(node.value, terminator: " ")
            currentNode = node.next
        }
    }
}

var listByLee = LinkListByLee<Character>()
var previousNodeByLee: LinkListNodeByLee<Character>? = nil
for letter in "abcdefghijklmnopqrstuvwxyz" {
    let node = LinkListNodeByLee(value: letter)
    if let predecessor = previousNodeByLee {
        predecessor.next = node
    } else {
        listByLee.start = node
    }
    previousNodeByLee = node
}
listByLee.printNode()

//==============================================================================================================================
//Solution by By Paul Hudson

/*
 Linked lists are a simple data structure that you ought to be able to code from scratch in a couple of minutes. At first it’s easy to see them as hobbled arrays, but the truth is they have their own advantages and disadvantages just like any data structure.
 For example, if you want to insert a new value into the middle of an array, the insert() method is O(n) – it takes longer and longer depending on the size of the array. This is because Swift has to move other items down one space before inserting the new item. In comparison, inserting something into the middle of a linked list is O(1) because you just change two pointers. On the other hand, jumping to an arbitrary position in an array is O(1), whereas it’s O(n) in a linked list because you need to start at the first node and work your way down the chain.
 Let’s jump in to the solution, starting with a custom class to handle nodes:
 
 class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    init(value: T) {
    self.value = value
    }
 }
 
 So, each node has a value, as well as an optional link to its successor. In the initializer we only set the value, because we’ll be setting the next property after creation.
 Wrapping that node type in a parent class is trivial:
 We’ll come back to that soon to add a printNodes() method.
 In order to create our linked list, we’re going to start by creating two variables:
 The previousNode will be used to create our chain – each time we get a letter to create, we’ll see the next property of previousNode to the most recently created node.
 This is all done using a loop. As I said in the hints, the smartest way to loop over the letters of the alphabet is just to type them in a string and treat it like an array.
 Inside the loop we’ll create a new LinkedListNode for the current letter. If previousNode is nil it means this is the first letter to be created, so we’ll set list.start to be the new node. Otherwise we have a predecessor – the node that should link to this new node – so we’ll update its next property to point at the new node.
 Here’s all that in code:
 
 class LinkedList<T> {
 var start: LinkedListNode<T>?
    }
 
 var list = LinkedList<Character>()
 var previousNode: LinkedListNode<Character>? = nil
    for letter in "abcdefghijklmnopqrstuvwxyz" {
    let node = LinkedListNode(value: letter)
        if let predecessor = previousNode { predecessor.next = node
        } else {
            list.start = node
        }
    previousNode = node
 }
 
 So, at this point we’ve accomplished two of the three parts to this challenge: we’ve created our own linked list data type, and created a list out of the alphabet. All that remains is traversing the list to print out all its values on a single line, separated by spaces.
 Once you know that the print() function has a terminator parameter that lets you specify something other than a line break to use after the line is printed, this method is pretty straightforward:
 1. Pick out the first node in the list using the start property and make that the current node.
 2. While the current node is not nil, print out its value with a space for the terminator.
 3. Update the current node to be equal to the value of its next property, thereby moving to the next element in the list. That’s it! Here’s the code:
 
 if let predecessor = previousNode { predecessor.next = node
 } else {
    list.start = node
 }
    previousNode = node
 }
 
 func printNodes() {
    var currentNode = start
    while let node = currentNode {
    print(node.value, terminator: " ")
    currentNode = node.next
    }
 }
 For reference, here’s my complete solution to this challenge:
 
 */
class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    var start: LinkedListNode<T>?
    func printNodes() {
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
list.printNodes()
