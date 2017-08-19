//: Playground - noun: a place where people can play

import Foundation

var text = "abc"

struct Foo<T> {

  let p: UnsafeMutablePointer<T>

  init(p: UnsafeMutablePointer<T>) {
    self.p = p
  }

}

let f = Foo(p: &text)

f.p.pointee = "a"

f.p.pointee

text

