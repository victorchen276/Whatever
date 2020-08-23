import UIKit

//var str = "Hello, playground"

protocol Souschef{
    func chop(vegetable: String) -> String
    func rinse(vegetable: String) -> String
}

class Roommate: Souschef {
    var hungry = true
    var name:String
    
    init(hungry: Bool, name: String) {
        self.hungry = hungry
        self.name = name
    }
    
    func chop(vegetable: String) -> String {
        
        return ""
    }
    
    func rinse(vegetable: String) -> String {
        
        return ""
    }

}

extension Roommate: Equatable {
    public static func ==(lhs: Roommate, rhs: Roommate) -> Bool{

        return lhs.name == rhs.name && lhs.hungry == rhs.hungry
    }
}


struct Pizza {
  let ingredients: [String]
}

protocol Pizzeria {
  func makePizza(_ ingredients: [String]) -> Pizza
  func makeMargherita() -> Pizza
}

extension Pizzeria {
  func makeMargherita() -> Pizza {
    return makePizza(["tomato", "mozzarella"])
  }
}

struct Lombardis: Pizzeria {
  func makePizza(_ ingredients: [String]) -> Pizza {
    return Pizza(ingredients: ingredients)
  }

  func makeMargherita() -> Pizza {
    return makePizza(["tomato", "basil", "mozzarella"])
  }
}


let lombardis1: Pizzeria = Lombardis()
let lombardis2: Lombardis = Lombardis()
let lombardis3 = Lombardis()


lombardis1.makeMargherita()
lombardis2.makeMargherita()
lombardis3.makeMargherita()
