//: [Previous](@previous)

import Foundation

protocol FooType {
  
}

class Foo<T>: FooType {
  
}

let a = Foo<String>()
let b = Foo<Int>()
let c = Foo<Float>()

let array: [FooType] = [a, b, c]

array.flatMap { $0 as? Foo }


//: [Next](@next)
