//: [Previous](@previous)

import Foundation

enum Error: Swift.Error, LocalizedError {
  case a

  var errorDescription: String? {
    switch self {
    case .a:
      return "hello"
    }
  }
}

print(Error.a.localizedDescription)

//: [Next](@next)
