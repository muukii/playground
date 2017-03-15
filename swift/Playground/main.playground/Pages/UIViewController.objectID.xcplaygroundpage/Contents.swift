//: [Previous](@previous)

import UIKit

enum A {
  class B: UIViewController {}
}
let vc = A.B()
vc.description
vc.debugDescription

let a = A.B()

ObjectIdentifier(vc).hashValue
ObjectIdentifier(a).hashValue
ObjectIdentifier(A.B()).hashValue
ObjectIdentifier(A.B()).hashValue

NSStringFromClass(vc.classForCoder)
String(describing: vc.classForCoder)
String(describing: type(of: vc))

//: [Next](@next)
