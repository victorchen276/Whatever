import UIKit

var str = "Hello, playground"
var myVariable = 123
let myConstantVariable = 123

let explicitInt:Int = 5
explicitInt + 4
var explicitDouble:Double = 5
explicitDouble + 0.3

//for int i=0 i<5 i++{
//    print(i)
//}
//numbers.count
//for i in 0..<5 {
//    print(i)
//}
var nums = [2,3,4,5,6]
var map = [Int : Int]()
for i in 0..<nums.count{
    map[i] = nums[i]
}

let val:Int = 1
let timed:Bool = {
    if val == 1 {
        return true
    }
    else{
        return false
    }
}()


/*
 Overloading happens at compile-time while Overriding happens at runtime: The binding of overloaded method call to its definition has happens at compile-time however binding of overridden method call to its definition happens at runtime.
 
 Static methods can be overloaded which means a class can have more than one static method of same name. Static methods cannot be overridden, even if you declare a same static method in child class it has nothing to do with the same method of parent class.
 
 The most basic difference is that overloading is being done in the same class while for overriding base and child classes are required. Overriding is all about giving a specific implementation to the inherited method of parent class.
 
 Static binding is being used for overloaded methods and dynamic binding is being used for overridden/overriding methods.
 
 Performance: Overloading gives better performance compared to overriding. The reason is that the binding of overridden methods is being done at runtime.
 
 private and final methods can be overloaded but they cannot be overridden. It means a class can have more than one private/final methods of same name but a child class cannot override the private/final methods of their base class.
 
 Return type of method does not matter in case of method overloading, it can be same or different. However in case of method overriding the overriding method can have more specific return type (refer this).
 
 Argument list should be different while doing method overloading. Argument list should be same in method Overriding.
 
 Overriding needs inheritance while overloading not.
 

 
 */
class a{
    func funcabc(_ aparam:Int) -> Void{
        
    }
    func funcabc(_ aparam:Int, _ bparam:Bool) -> Void {
        
    }
    
    func funcabcd(_ aparam:Int) -> Int{
        return 0
    }
}


struct Person {
    var firstName : String
    var lastName : String? = nil
    
    init(firstName: String) {
        self.firstName = firstName
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

var john = Person(firstName: "John", lastName: "Smith")
var jane = Person(firstName: "Jane")
