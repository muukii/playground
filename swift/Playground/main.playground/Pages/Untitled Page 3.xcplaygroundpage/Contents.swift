//: [Previous](@previous)

import Foundation

var array = [0,1,2,3,4,5,6,7,8,9]

let slice = array[2..<6]

let _a = Array(slice)

_a[0]

let start = slice.indices.startIndex

slice[start]

let next = start.advanced(by: 1)

slice.first

//: [Next](@next)
