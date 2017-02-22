//: [Previous](@previous)

import Foundation

enum MessageType {

  enum Body {
    case text(String)
    case image(URL)
  }

  case me(Body)
  case partner(Body)
}

let m = MessageType.me(.text("a"))

if case .me(.text(let b)) = m {
  print(b)
}


//: [Next](@next)
