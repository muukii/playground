//: [Previous](@previous)

import Foundation

let source: [String] = (0...101).map { String($0) }

let interval: Int = 1

var joinedSource: [String] = []

source.enumerated().forEach { i, m in
  if i % interval == 0 {
    joinedSource.append("☺️")
  }
  joinedSource.append(m)
}

joinedSource.forEach {
  print($0)
}

//: [Next](@next)
