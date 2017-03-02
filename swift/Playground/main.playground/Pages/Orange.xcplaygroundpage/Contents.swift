//: [Previous](@previous)

import Foundation

let width = 3
let set1 = Array<Array<String>>(repeating: ["❤️", "💙"], count: width).flatMap { $0 }
let set2 = Array<Array<String>>(repeating: ["💙", "❤️"], count: width).flatMap { $0 }

(0...30).forEach { i in
  if i % 2 == 0 {
    print(set1.joined(separator: ""), separator: "")
  } else {
    print(set2.joined(separator: ""), separator: "")
  }
}

//: [Next](@next)
