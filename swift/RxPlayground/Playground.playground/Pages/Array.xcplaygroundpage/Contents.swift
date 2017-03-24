//: [Previous](@previous)

import Foundation

import RxSwift

let a = Variable<String>("a")
let b = Variable<String>("b")
let c = Variable<String>("c")

Observable.combineLatest([
  a.asObservable(),
  b.asObservable(),
  ])
  .debug()
  .subscribe()



//: [Next](@next)
