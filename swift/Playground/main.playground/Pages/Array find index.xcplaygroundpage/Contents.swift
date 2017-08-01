//: [Previous](@previous)

import Foundation

let a = ["1","2","3","3","3","4"]

a.enumerated().filter { $0.element == "3" }.indices

let o = zip(a, a.indices).filter { $0.0 == "3" }
o

//: [Next](@next)
