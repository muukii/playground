//: [Previous](@previous)

import Foundation

import RxSwift

func operation() -> Observable<Int> {
  return .error("Failed")
}

let queue = PublishSubject<Observable<Int>>()

queue
  .map {
    $0.materialize()
  }
  .merge()
  .debug()
  .subscribe()

queue.onNext(operation())
queue.onNext(operation())

//: [Next](@next)
