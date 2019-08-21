//: [Previous](@previous)

import UIKit

struct MyObject {
  let name = "muuk"

//  var description: String {
//    return "Foo"
//  }
//
//  var debugDescription: String {
//    return "inDebug"
//  }
}

//let view = UIView()

print(MyObject())
debugPrint(MyObject())

let mirror = Mirror(reflecting: MyObject())
for child in mirror.children {
  print(child.label, child.value)
}

//: [Next](@next)
