//: Playground - noun: a place where people can play

import Foundation
import Runes
import Curry

func insert(value: Int) -> String {
  print(value)
  return value.description
}

func run() -> Int {
  return 0
}

let a = insert <^> run()
print(a)
