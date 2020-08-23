import UIKit

/*
 1: The director accepts inputs and coordinates with the builder. This is usually a view controller or a helper class that's used by a view controller.
 2: The product is the complex object to be created. This can be either a struct or a class, depending on desired refrence semantics. It's usually a model, but it can be any type depending on your use case.
 3: The builder accepts step-bu-step inputs and handles the creation of the product. This is often a class, so it can be resued by reference.
 
 The Builder is only needed when an object cannot be produced in one step.
 
 Builder focuses on constructing a complex object step by step. Abstract Factory emphasizes a family of product objects (either simple or complex). Builder returns the product as a final step, but as far as the Abstract Factory is concerned, the product gets returned immediately.
 Builder often builds a Composite.
 Often, designs start out using Factory Method (less complicated, more customizable, subclasses proliferate) and evolve toward Abstract Factory, Prototype, or Builder (more flexible, more complex) as the designer discovers where more flexibility is needed.
 Sometimes creational patterns are complementary: Builder can use one of the other patterns to implement which components get built. Abstract Factory, Builder, and Prototype can use Singleton in their implementations.
 */


//MARK: - Product
public struct Hamburger {
    public let meat: Meat
    public let sauce: Sauces
    public let toppings: Toppings
}

extension Hamburger: CustomStringConvertible {
    public var description: String {
        return meat.rawValue + " burger"
    }
}

public enum Meat: String {
    case beef
    case chicken
    case ketten
    case tofu
}


public struct Sauces: OptionSet {
    public static let mayonnaise = Sauces(rawValue: 1 << 0)
    public static let mustard = Sauces(rawValue: 1 << 1)
    public static let ketchup = Sauces(rawValue: 1 << 2)
    public static let secret = Sauces(rawValue: 1 << 3)
    
    public let rawValue: Int
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

public struct Toppings: OptionSet {
    public static let cheese = Toppings(rawValue: 1 << 0)
    public static let lettuce = Toppings(rawValue: 1 << 1)
    public static let pickles = Toppings(rawValue: 1 << 2)
    public static let tomatoes = Toppings(rawValue: 1 << 3)
    
    public let rawValue: Int
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}


// MARK: - Builder
public class HamburgerBuilder {
    public private(set) var meat: Meat = .beef
    public private(set) var sauces: Sauces = []
    public private(set) var toppings: Toppings = []
    
    private var soldOutMeats: [Meat] = [.ketten]
    
    public func addSauces(_ sauce: Sauces) {
        sauces.insert(sauce)
    }
    
    public func removeSauces(_ sauce: Sauces) {
        sauces.remove(sauce)
    }
    
    public func addToppings(_ topping: Toppings) {
        toppings.insert(topping)
    }
    
    public func removeToppings(_ topping: Toppings) {
        toppings.remove(topping)
    }
    
    public func setMeat(_ meat: Meat) throws {
        guard isAvailable(meat) else { throw Error.soldOut}
        self.meat = meat
    }
    
    public func build() -> Hamburger {
        return Hamburger(meat: meat, sauce: sauces, toppings: toppings)
    }
    
    public enum Error: Swift.Error {
        case soldOut
    }
    
    public func isAvailable(_ meat: Meat) -> Bool {
        return !soldOutMeats.contains(meat)
    }
}

public class Employee {
    public func createCombo1() throws -> Hamburger {
        let builder = HamburgerBuilder()
        try builder.setMeat(.beef)
        builder.addSauces(.secret)
        builder.addToppings([.lettuce, .tomatoes, .pickles])
        return builder.build()
    }
    
    public func createKittenSpeical() throws -> Hamburger {
        let builder = HamburgerBuilder()
        try builder.setMeat(.ketten)
        builder.addSauces(.mustard)
        builder.addToppings([.lettuce, .tomatoes])
        return builder.build()
    }
}

let burgerFlipper = Employee()
if let combo1 = try? burgerFlipper.createCombo1() {
    print("Nom nom " + combo1.description)
}

//if let combo2 = try? burgerFlipper.createKittenSpeical() {
//    print("Nom nom " + combo2.description)
//} else {
//    print("asfasfsfd")
//}

do {
    try burgerFlipper.createKittenSpeical()
    
} catch HamburgerBuilder.Error.soldOut{
    print("HamburgerBuilder.Error.soldOut")
}

