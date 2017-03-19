//: [Previous](@previous)

import Foundation

import RxSwift
import RxCocoa
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let s = PublishSubject<Observable<Void>>()

let o = Observable<Void>.create { o in

  print("run")
  o.onNext()
  o.onCompleted()
  return Disposables.create()
  }
  .debug()

let o2 = Observable<Void>.create { o in

  print("run2")
  after(1) {
    o.onNext()
    o.onCompleted()
  }

  return Disposables.create()
  }
  .debug()

s
  .debug("in")
  .flatMapFirst { $0 }
  .debug("out")
  .subscribe()

s.onNext(o2)
s.onNext(o)

after(2) {
  s.onNext(o)
}


//: [Next](@next)
