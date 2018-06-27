import Foundation

import PromiseKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//print(Thread.current)

func run() -> Promise<Int> {

  return
    Promise<Int>.init { (r) in

      DispatchQueue.global().asyncAfter(deadline: .now() + 1, execute: {

        //    print(Thread.current)

        r.fulfill(1)
      })

      }
      .then { (v) -> Guarantee<Int> in
        Guarantee<Int>.init(resolver: { (c) in
          c(v + 1)
        })
  }
}
