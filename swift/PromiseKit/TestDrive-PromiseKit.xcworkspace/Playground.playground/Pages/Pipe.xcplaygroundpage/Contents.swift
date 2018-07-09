//: [Previous](@previous)

import Foundation
import PromiseKit

firstly {
  .value(3)
}
  .pipe { r in
    print(r)
}


//: [Next](@next)
