//: [Previous](@previous)

import Foundation

import UIKit

func create() -> [UIView] {
  print("create")
  return [UIView()]
}

let array = [
  [UIView()],
  [UIView()],
  [UIView()],
  ]
  .joined(separator: [create()])

print(Array(array))

//: [Next](@next)
