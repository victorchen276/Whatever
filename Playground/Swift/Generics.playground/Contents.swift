import UIKit

//var str = "Hello, playground"
//Generic Functions and Generic Types
//Protocols with Associated Types
//Generic Where Clauses
//Generic Subscripts


//protocol Company {
//  func buy<T>(product: T, with money: Money)
//  func sell<T>(product: T.Type, for money: Money) -> T?
//}

//Generic Type
struct InventoryList<T> {
  var items: [T]
  mutating func add(item: T) {
    items.append(item)
  }
  mutating func remove() -> T {
    return items.removeLast()
  }
  func isCapacityLow() -> Bool {
    return items.count < 3
  }
}

struct PastaPackage {
    
}

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")


func findIndex<X: Equatable>(of valueToFind: X, in array:[X]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
// doubleIndex is an optional Int with no value, because 9.3 isn't in the array
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
// stringIndex is an optional Int containing a value of 2
//test
