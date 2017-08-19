//: Playground - noun: a place where people can play

import Foundation

var array: [Int64] = [1,2]

array.withUnsafeBufferPointer { (p: UnsafeBufferPointer<Int64>) -> Void in
  p.baseAddress
  p.startIndex
  p[0]
  p[1]
  print(p)
}

array.withUnsafeBytes { (p: UnsafeRawBufferPointer) -> Void in
  p.indices
  print(p)
}

array.withUnsafeMutableBytes { (p: UnsafeMutableRawBufferPointer) -> Void in
  print(p)
}

array.withUnsafeMutableBufferPointer { (p: inout UnsafeMutableBufferPointer<Int64>) -> Void in
  p[0] = 50
  print(p)
}

print(array)
