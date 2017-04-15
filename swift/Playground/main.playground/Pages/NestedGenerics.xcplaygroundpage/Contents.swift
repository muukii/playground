//: [Previous](@previous)

import Foundation

class Parent<V> {

  class Inner<D> {

    func run<T: Collection>(_ c: (T) -> Void) where T.Iterator.Element == V {

    }
  }
}

extension Parent.Inner where D: Hashable {

}

//: [Next](@next)
