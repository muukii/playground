//: [Previous](@previous)

import Foundation

let count = 500

/*
 > []
 > [][]
 > [][][]
 > [][][][]
 > [][][][][]

 */

do {
  var a = [Int?]()
  for i in 0..<count {
    a.append(i)
  }
}

do {
  var a = [Int?]()
  a.reserveCapacity(count)
  for i in 0..<count {
    a.append(i)
  }
}

/*
  [ , , , , , , , , , , , , , ]
 */

do {
  var a = [Int?].init(repeating: nil, count: count)
  for i in 0..<count {
    a[i] = i
  }
  a.flatMap { $0 }
}

//: [Next](@next)
