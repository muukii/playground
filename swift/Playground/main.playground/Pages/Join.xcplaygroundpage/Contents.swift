//: [Previous](@previous)

import Foundation

import UIKit

let elements: [[UIView]] = [
  [UIView()],
  [UIView()],
  [UIView()],
]

func create() -> [UIView] {
  print("create")
  return [UIView()]
}

let a = elements.joined(separator: create())
a.count
print(a)

//: [Next](@next)
