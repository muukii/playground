//: [Previous](@previous)

import Foundation

struct Model {

  var identity: Int {
    return ObjectIdentifier(Model.self).hashValue
  }
}

class __Class {
  
  var identity: Int {
    return ObjectIdentifier(self).hashValue
  }
}

let m1 = Model()
let m2 = Model()

__Class().identity
__Class().identity
__Class().identity
__Class().identity

m1.identity
m2.identity

//: [Next](@next)
