//: [Previous](@previous)

import Foundation

func log(_ s: @autoclosure () -> String) {
  print(s())
}

log("aaa")

//: [Next](@next)
