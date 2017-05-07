//: [Previous](@previous)

import Foundation

var str = "He\\,llo,, playground"

print(str.characters.split(separator: ",").map { String($0) })

print(str.characters.split(separator: ",", omittingEmptySubsequences: false).map { String($0) })

//: [Next](@next)
