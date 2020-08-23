import UIKit

struct Device {
    var type: String
    var price: Float
    var color: String
}

var myiMacPro = Device(type: "iMac Pro", price: 4999.00, color: "Space Grey")
var myiPhone6Plus = Device(type: "iPhone", price: 799.00, color: "White")
var myiPhone7 = Device(type: "iPhone", price: 699.00, color: "Black")
var myiPad = Device(type: "iPad", price: 599.00, color: "Space Grey")
var myAppleWatch = Device(type: "Apple Watch", price: 349.00, color: "Space Grey")
var myAppleTV = Device(type: "Apple TV", price: 199.00, color: "Black")

let myDevices = [myiMacPro, myiPhone6Plus, myiPhone7, myiPad, myAppleWatch, myAppleTV]

//Filter
//Use filter to loop over a collection and return an Array containing only those elements that match an include condition.
let iPhones = myDevices.filter({return $0.type == "iPhone"})

print(iPhones)

//Map
//Use map to loop over a collection and apply the same operation to each element in the collection. 
let canadianPrices:[Float] = myDevices.map({return $0.price * 1.2})
print(canadianPrices)

//reduce
//The reduce method takes two values, an initial value and a combine closure.
let totalCanadianPrice: Float = canadianPrices.reduce(0.0, +)
print(totalCanadianPrice)
