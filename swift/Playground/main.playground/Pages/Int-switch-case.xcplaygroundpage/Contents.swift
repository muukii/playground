//: [Previous](@previous)

import Foundation

let a = 1
let b = 2
let c = 3

(a == b) && (a == c)

switch (a, b, c) {
case (0..<1, 0..<1, 0..<3):
  break
case (0, 0, 0):
  break
default:
  break
}

//: [Next](@next)
