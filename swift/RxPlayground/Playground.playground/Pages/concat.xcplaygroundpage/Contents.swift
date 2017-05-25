//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import RxSwift
import RxCocoa

PlaygroundPage.current.needsIndefiniteExecution = true

let o1 = Single<Void>.create { o in
  
  print("-1")
  DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
    print("+1")
    o(.success())
  })
  
  return Disposables.create()
}

let o2 = Single<Void>.create { o in
  
  print("-2")
  DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
    print("+2")
    o(.success())
  })
  
  return Disposables.create()
}

let o3 = Single<Void>.create { o in
  
  print("-3")
  DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
    print("+3")
    o(.success())
  })
  
  return Disposables.create()
}

Observable.from([
  o1,
  o2,
  o3,
  ])
  .concat()
  .reduce((), accumulator: { _ in () })
  .asSingle()
  .debug()
  .subscribe()

//: [Next](@next)
