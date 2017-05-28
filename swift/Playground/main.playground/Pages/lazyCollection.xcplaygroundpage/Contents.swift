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


//let _a = source.map { $0.run() }
//print("end")

let _a = source.lazy
  .filter { $0.index > 0 }
  .map { $0.run() }

_a.isEmpty



//_b[0]


//print("lazy")
//source
//  .lazy
//  .map { $0.run() }
//  .index { (b) -> Bool in
//    b.index == 1
//}
//
//print("lazy2")
//source
//  .lazy
//  .map { $0.run() }
//  .index { (b) -> Bool in
//    b.index == 1
//  }
//
//source.prefix(3)


//: [Next](@next)
