//: [Previous](@previous)

import Foundation

import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let s = PublishSubject<Observable<Int>>()

func after(_ s: Double, _ n: Int) -> Observable<Int> {
  return Observable<Int>.create { o in
    
    DispatchQueue.main.asyncAfter(deadline: .now() + s, execute: {
      o.onNext(n)
      o.onCompleted()
    })
    
    return Disposables.create()
  }
}

s
  .debug()
  .flatMap { $0 }
  .debug()
  .subscribe()

s.onNext(after(2, 1))
s.onNext(after(1, 2))

//s
//  .debug()
//  .concatMap { $0 }
//  .debug()
//  .subscribe()
//
//s.onNext(after(2, 1))
//s.onNext(after(1, 2))

//: [Next](@next)
