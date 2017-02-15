//: [Previous](@previous)

import Foundation

struct Model {

  var identity: Int {
    return ObjectIdentifier(Model.self).hashValue
  }
}

let m1 = Model()
let m2 = Model()

m1.identity
m2.identity

//: [Next](@next)
