import UIKit

var str = "Hello, playground"
//Define and call

//a stored property that is initialized via a closure
let pushBehavior1: UIPushBehavior = {
    let lazilyCreatedPush = UIPushBehavior()
    lazilyCreatedPush.setAngle(50, magnitude: 50)
    return lazilyCreatedPush
}()


//a computed property
var pushBehavior2: UIPushBehavior {
    get{
        let lazilyCreatedPush = UIPushBehavior()
        lazilyCreatedPush.setAngle(50, magnitude: 50)
        return lazilyCreatedPush
    }
}

//The stored property's initialization closure is called once and only once, but you can later change the value of the stored property (unless you replace var with let). This is useful when you want to encapsulate the code to initialize a stored property in a single, concise block of code.
//
//The computed property's block, however, is called each time you reference the variable. It’s useful when you want the code to be called every time you reference the computed property. Generally you do this when the computed property needs to be recalculated every time you reference the stored property (e.g. recalculated from other, possibly private, stored properties).
//
//In this case, you undoubtedly want the stored property (the first example), not the computed property (the second example). You presumably don't want a new push behavior object each time you reference the variable.


//function as value
func doThis(_ f:() ->()) {
    f()
}

func whatToDo() {
    print("I did it")
}

doThis {
    whatToDo()
}

//read only property

var one: Int {
    return 1
}
var two: Int {
    get { return 2 }
}

print(one)
print(two)



//closure
