//: [Previous](@previous)

import Foundation
import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

final class CancelToken {
  
  fileprivate var cancelTrigger: Observable<Void> {
    return s
  }
  
  private let s = PublishSubject<Void>()
  
  init() {
    
  }
  
  func cancel() {
    s.onNext()
  }
}

extension Observable {
  
  func cancelled(by token: CancelToken) -> Observable<E> {
    return takeUntil(token.cancelTrigger)
  }
}

extension PrimitiveSequence where Trait == MaybeTrait {
  
  func cancelled(by token: CancelToken) -> Maybe<Element> {
    return
      asObservable()
        .takeUntil(token.cancelTrigger)
        .asMaybe()
  }
}

extension PrimitiveSequence where Trait == SingleTrait {
  
  func cancelled(by token: CancelToken) -> Single<Element> {
    return
      asObservable()
        .takeUntil(token.cancelTrigger)
        .asSingle()
  }
}

extension PrimitiveSequence where Trait == CompletableTrait, Element == Never {
  
  func cancelled(by token: CancelToken) -> Completable {
    return
      asObservable()
        .takeUntil(token.cancelTrigger)
        .asCompletable()
  }
}


let task1 = Single<Void>.create { o in
  
  print("task1 begin")
  DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
    print("task1 end")
    o(.success())
  })
  
  return Disposables.create()
}

let task2 = Single<Void>.create { o in
  
  print("task2 begin")
  DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
    print("task2 end")
    o(.success())
  })
  
  return Disposables.create()
}

let token = CancelToken()

let s = task1
  .cancelled(by: token)
  .flatMap {
    task2
  }
  .asObservable()
  .shareReplay(1)

s.debug().subscribe()
s.debug().subscribe()

DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
  token.cancel()
})

//: [Next](@next)
