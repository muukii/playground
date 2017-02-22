//: [Previous](@previous)

import Foundation

public struct LoopIterator<T>: IteratorProtocol {

  private var currentIndex: Int = 0
  internal let source: [T]

  public init(source: [T]) {
    self.source = source
  }

  public mutating func next() -> T? {

    guard source.isEmpty == false else {
      return nil
    }

    let e = source[currentIndex]

    currentIndex = currentIndex.advanced(by: 1)

    if source.indices.contains(currentIndex) == false {
      currentIndex = 0
    }
    
    return e
  }
}

let array = ["😎", "🤠", "🤔"]

var i = LoopIterator(source: array)

i.next()
i.next()
i.next()
i.next()
i.next()
i.next()
i.next()
i.next()

//: [Next](@next)
