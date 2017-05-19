//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import RxSwift
import RxCocoa

PlaygroundPage.current.needsIndefiniteExecution = true

let o = Single<Void>.create { o in
  
  print("-")
  DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
    print("+")
    o(.success())
  })
  
  return Disposables.create()
}

Observable.from([
  o,
  o,
  o,
  ])
  .concat()
  .reduce((), accumulator: { _ in () })
  .asSingle()
  .debug()
  .subscribe()

//: [Next](@next)
