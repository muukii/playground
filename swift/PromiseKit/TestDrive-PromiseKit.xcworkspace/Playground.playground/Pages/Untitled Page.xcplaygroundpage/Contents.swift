import Foundation

import PromiseKit
import PlaygroundSupport

firstly { () -> Promise<Int> in
  print("in firstly")
  return Promise<Int>.value(1)
}
  .then { (v) -> Promise<Int> in
    print("in secondly")
    return Promise<Int>.value(1)
  }
  .done {
    print($0)
}

print("end")
