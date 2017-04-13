//: [Previous](@previous)

import Foundation

enum Root {
  class A: NSObject {

    class B {

    }
  }
}

let a = Root.A()
let b = Root.A.B()

String(describing: a)
String(describing: type(of: a))
String(NSStringFromClass(type(of: a)))

let m = Mirror.init(reflecting: a)
m.description

ObjectIdentifier(a).debugDescription
String(reflecting: type(of: a))

let m1 = Mirror(reflecting: type(of: a))
m1.description

//: [Next](@next)
