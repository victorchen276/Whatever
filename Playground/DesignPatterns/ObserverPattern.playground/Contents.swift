import UIKit
import Foundation
//the observer pattern lets one object observer changes on another object
//1: using key value observation (KVO)
//2: using an observable wrapper

//this pattern involves two main objects
//1: the usbject is the object that's being observer.
//2: the observer is the object doing the observing.


@objcMembers public class KVOUser: NSObject {
    dynamic var name: String
    /*
     dyname means that the dynamic dispatch system mof Objective-C is used to call the getter
     and setter of the property. This means that never, ever, will static or virtual dispatch
     be used, even from Swift. This is required for KVO to work, because KVO swizzles the
     setter of the property to insert its required magic.
     */
    public init(name: String) {
        self.name = name
    }
}


print("--- KVO Example ---")
let kvoUser = KVOUser(name: "Ray")
var kvoObserver: NSKeyValueObservation? = kvoUser.observe(\.name, options: [.initial, .new]) { (user, change) in
    print("User's name is \(user.name)")
}
//in swift you don't have to explicitly remove KVO observers or closures.
//Instead, observers are weakly referenced, and thir related closures are automatically
//rmeoved whenever an observer becomes nil.
//In past versions of Swift and Objective-C, you had to explicitly call removeObserver(_:forKeyPath:),
//or else your app would crash whenever you tried to access a deallocated observer.

//It's great that KVO takes care of automatically removing observers, but this doesn't
//really make up for KVO's biggest downside: You're required to subclass NSObject and user the Obejctive-C runtime
//If you're note objey with this, you can create your own Observable wrapper to get around these limitations.

kvoUser.name = "Rockin' Ray"
kvoObserver = nil
kvoUser.name = "Ray has left the building"

public struct ObserableOptions: OptionSet {
    public static let initial = ObserableOptions(rawValue: 1 << 0)
    public static let old = ObserableOptions(rawValue: 1 << 1)
    public static let new = ObserableOptions(rawValue: 1 << 2)
    
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

public class Observable<Type> {
    fileprivate class Callback {
        fileprivate weak var observer: AnyObject?
        fileprivate let options: [ObserableOptions]
        fileprivate let closure: (Type, ObserableOptions) -> Void
        
        fileprivate init (observer: AnyObject, options: [ObserableOptions], closure: @escaping (Type, ObserableOptions) -> Void) {
            self.observer = observer
            self.options = options
            self.closure = closure
        }
    }
    //MARK: - Properties
    public var value: Type
    //MARK: - Object Lifecycle
    public init(_ value: Type) {
        self.value = value
    }
}
