//: [Previous](@previous)

import Foundation

struct Box: CustomDebugStringConvertible {

  let index: Int

  init(_ i: Int) {
    self.index = i
  }
  func run() -> Box {
    print("run : \(debugDescription)")
    return self
  }

  var debugDescription: String {
    return "\(index)"
  }
}

let source: [Box] = [.init(0), .init(1), .init(2), .init(3), .init(4)]

print("non-lazy")
source.map { $0.run() }

print("lazy")
source
  .lazy
  .map { $0.run() }
  .index { (b) -> Bool in
    b.index == 1
}

print("lazy2")
source
  .map { $0.run() }
  .lazy
  .index { (b) -> Bool in
    b.index == 1
  }


//: [Next](@next)
