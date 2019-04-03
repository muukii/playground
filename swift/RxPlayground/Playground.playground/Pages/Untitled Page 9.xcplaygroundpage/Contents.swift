//: [Previous](@previous)

import RxSwift

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var s: PublishSubject<Int>? = PublishSubject<Int>()

(s as Observable<Int>!)
  .asSingle()
  .debug()
  .subscribe()

s?.onNext(3)

s?.dispose()
s = nil


//: [Next](@next)
