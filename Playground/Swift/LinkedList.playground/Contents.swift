import UIKit

class Node {
    var value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}


let node1 = Node(value: 1)
let node2 = Node(value: 2)
node1.next = node2


class LinkedList {
    var head: Node?
    
    init(head: Node?) {
        self.head = head
    }
    
    
    func append(_ node: Node){
        guard head != nil else{
            head = node
            return
        }
        var current = head
        while let _ = current?.next {
            current = current?.next
        }
        current?.next = node
    }
    
//    func retrieve() -> Node {
//
//        return AnyObject
//    }
    
    
}
