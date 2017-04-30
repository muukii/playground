//: [Previous](@previous)

import Foundation

enum Style {
  
  static let margin: CGFloat = 16
}

extension CGFloat {
  
  static let style = Style.self
}

CGFloat.style.margin

CGSize(width: CGFloat.style.margin, height: CGFloat.style.margin)

//: [Next](@next)
