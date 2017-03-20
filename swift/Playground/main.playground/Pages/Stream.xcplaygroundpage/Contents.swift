//: [Previous](@previous)

import Foundation

var stream = ""

print("aa", to: &stream)

struct MyStream: TextOutputStream {

  mutating func write(_ string: String) {
    print(string)
  }
}

var mystream = MyStream()

print("hello", to: &mystream)


//: [Next](@next)
