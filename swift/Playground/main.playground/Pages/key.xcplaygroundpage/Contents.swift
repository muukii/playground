//: [Previous](@previous)

import Foundation

let rawKey = "abc.abc.abc"

extension String {
  func camelCased() -> String {

    let tokens = rawKey.components(separatedBy: ".")

    guard let first = tokens.first else {
      return self
    }

    let cased = tokens.dropFirst()
      .map { token in
        token.characters.first
          .map {
            String($0).uppercased().characters + token.characters.dropFirst()
          }
          .map {
            String($0)
        }
      }
      .flatMap { $0 }
    
    let resolvedTokens = [first] + cased
    return resolvedTokens.joined()
  }
}
// abcAbcAbc

rawKey.camelCased()

//: [Next](@next)
