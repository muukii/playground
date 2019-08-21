//: [Previous](@previous)

import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let taskB = Single.deferred {
  Single<Void>.create { o in
    
    o(.error("OH"))
    
    return Disposables.create()
    }
    .asObservable()
    .share(replay: 1, scope: .forever)
    .asSingle()
    .debug("Subscribed TaskB")
}

let trigger = PublishSubject<Void>()

trigger
  .flatMap {
    taskB
      .retry(2)
  }
 
  .debug()
  .subscribe()

//trigger.on(.error("A"))
trigger.on(.next(()))

//: [Next](@next)
