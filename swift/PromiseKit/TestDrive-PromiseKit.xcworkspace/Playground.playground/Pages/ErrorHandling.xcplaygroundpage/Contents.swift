//: [Previous](@previous)

/*:
 # ErrorHandling
 */

import Foundation
import PromiseKit

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

func markPromise<T>(_ value: T) -> Promise<T> {
  return Promise<T> { r in
    print("->", value, Thread.current)
    r.fulfill(value)
  }
}

extension String : Error {}

/*:

 ## Occur Error in Chain

 */

firstly {
  .value(1)
  }
  .then {
    markPromise($0 + 1)
  }
  .ensure {
    print("ensure will be called everywhere. 1")
  }
  .then { _ in
    Promise<Int>.init(error: "Error!")
  }
  .ensure {
    print("ensure will be called everywhere. 2")
  }
  .then {
    markPromise($0 + 1)
  }
  .catch { (error) in
    print("Catch Error", error)
  }
  .finally {
    print("finally")
}

/*:

 ## Recover error

 */

firstly {
  .value(1)
  }
  .then {
    markPromise($0 + 1)
  }
  .ensure {
    print("ensure will be called everywhere. 1")
  }
  .then { _ in
    Promise<Int>.init(error: "Error!")
  }
  .recover { error in
    Promise.value(2)
  }
  .then { _ in
    Promise<Int>.init(error: "Error!")
  }
  .then {
    markPromise($0 + 1)
  }
  .catch { (error) in
    print("Catch Error", error)
  }
  .finally {
    print("finally")
}


//: [Next](@next)
