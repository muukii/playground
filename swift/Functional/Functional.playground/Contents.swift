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

/**
 public func <^> <T, U>(f: (T) -> U, a: T?) -> U? {
 return a.map(f)
 }
 */

/**
 public func <*> <T, U>(f: ((T) -> U)?, a: T?) -> U? {
 return a.apply(f)
 }
 */

do {

  let a: String? = "a"
  let b: String? = "b"

  //
  let _a: (String) -> (String) -> String = curry(+)

  let _: ((String) -> String)? = curry(+) <^> a

  curry(+) <^> a <*> b
  curry(+) <*> a <*> b

  a <* b
  a *> b
}

do {
  let ageString: String? = "19"

  let r1: Int?? = curry(Int.init) <^> ageString
  let r2: Int?? = curry(Int.init) <*> ageString
  let r3: Int? = curry(Int.init) -<< ageString
}
