//: [Previous](@previous)

import Foundation

let staticString = StaticString.init(stringLiteral: "abc")
staticString.description
staticString.debugDescription
let mirror = staticString.customMirror
print(mirror.children)

staticString.utf8CodeUnitCount
staticString.withUTF8Buffer { (p) -> Void in
  print(p)
}

let string = staticString.description

//: [Next](@next)
