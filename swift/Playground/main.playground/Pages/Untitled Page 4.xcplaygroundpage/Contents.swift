//: [Previous](@previous)

import Foundation

let count = 2000

/*
 []
 [][]
 [][][]
 [][][][]
 [][][][][]
 
 [, , , , ,  , , , , , , ,,]
 */

do {
  var a = [Int]()
  for i in 0..<count {
    a.append(i)
  }
}

do {
  var a = [Int]()
  a.reserveCapacity(10000)
  for i in 0..<count {
    a.append(i)
  }
}

do {
  var a = [Int].init(repeating: 0, count: count)
  for i in 0..<count {
    a[i] = i
  }
}

//: [Next](@next)
