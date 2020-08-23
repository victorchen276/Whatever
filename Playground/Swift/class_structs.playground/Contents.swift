import UIKit

class MacBook{
    var year: Int
    var color: String
    
    init(year: Int, color: String) {
        self.year = year
        self.color = color
    }
}


let myMacBook = MacBook(year: 2016, color: "Space Grey")
let stolenMacBook = myMacBook

stolenMacBook.color = "Spraypainted Green"
print(myMacBook.color)


struct iPhone {
    var number: Int
    var color: String
}

let myiPhone = iPhone(number: 7, color: "Black")
var stoleniPhone = myiPhone

stoleniPhone.color = "Rose Gold"

print(myiPhone.color)
