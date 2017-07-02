//: Playground - noun: a place where people can play

import UIKit

let a = [
  { () -> UIViewController in
    return .init()
  }()
]
  .lazy
  .map { $0 }
  .lazy
