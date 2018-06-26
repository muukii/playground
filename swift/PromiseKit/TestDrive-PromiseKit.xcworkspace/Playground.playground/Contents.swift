import UIKit
import PromiseKit

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

Promise<Int>.init { (r) in

  r.fulfill(1)
}
