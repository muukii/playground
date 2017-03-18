//: [Previous](@previous)

import Foundation

import RxSwift

let s = PublishSubject<Void>()

func value() -> Int {
  print("run")
  return 3
}

let v = Variable<Int>(3)

s
  .withLatestFrom(Observalbe.just(self.value))
  .debug()
  .subscribe()

s.onNext()
s.onNext()

//: [Next](@next)
