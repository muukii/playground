//: [Previous](@previous)

import Foundation

do {
  
  let a: UInt8 = 0b00001111
  let b = 0b00000000

  String(a, radix: 2)
  String(~a, radix: 2)
}

do {
  
  let b: UInt8 = 0
  let flag: UInt8 = 1 << 1

  let _b = b | flag
  _b & ~(flag)
  b & ~(flag)

}

let p = 0.1.bitPattern
String(p, radix: 2)

//: [Next](@next)
