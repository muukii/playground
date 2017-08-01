//: [Previous](@previous)

import RxSwift

let task = Completable.create { (o) -> Disposable in
  
  return Disposables.create()
}

let s = PublishSubject<Void>()

s
  .debug()
  .flatMap {
    Observable.just(1)
  }
  .debug()
  .flatMap { _ in
    Completable.create { o in
      o(.completed)
      return Disposables.create()
    }
  }
  .debug()
  .subscribe()

s.onNext()

//: [Next](@next)
