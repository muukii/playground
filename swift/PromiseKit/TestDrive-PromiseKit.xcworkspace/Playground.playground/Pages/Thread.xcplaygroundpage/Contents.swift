//: [Previous](@previous)

import Foundation
import PromiseKit

let backgroundQueue = DispatchQueue.global()

DispatchQueue.global().async {
  firstly { () -> Guarantee<Int> in
    print(Thread.current)
    return .value(1)
    }
    .then { _ -> Guarantee<Int> in
      print(Thread.current)
      return .value(1)
    }
    .then(on: backgroundQueue) { (v) -> Guarantee<Int> in
      print(Thread.current)
      return .value(1)
    }
    .then { _ -> Guarantee<Int> in
      print(Thread.current)
      return .value(1)
    }
    .then(on: backgroundQueue) { (v) -> Guarantee<Int> in
      print(Thread.current)
      return .value(1)
  }
}

//: [Next](@next)
