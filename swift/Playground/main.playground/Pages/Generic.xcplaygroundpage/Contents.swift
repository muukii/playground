//: [Previous](@previous)

import Foundation

protocol Parent {

  func add()
  func remove()
}

protocol Child: Parent {

}

protocol Protocol {
//  associatedtype A : Parent
  var object: Parent? { get }
}

extension Protocol {
  func foo() {
    self.object?.add()
  }
}

struct Foo: Parent {

  func add() {

  }

  func remove() {

  }

}

class Box: Protocol {
  var object: Child?
}

let o = Box()


//: [Next](@next)
