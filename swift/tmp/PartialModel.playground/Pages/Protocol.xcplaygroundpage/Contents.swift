//: [Previous](@previous)

import Foundation

extension Root : Grid, Detail {
  var _name: String {
    return name ?? ""
  }

  var _age: Int {
    return age ?? 0
  }
}

protocol Grid {
  var _name: String { get }
}

protocol Detail {
  var _name: String { get }
  var _age: Int { get }
}

let root: Grid = Root()

//: [Next](@next)
