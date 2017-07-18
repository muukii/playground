//: [Previous](@previous)

import RxSwift

let c = Completable.create { (o) -> Disposable in
  
  print("o")
  o(.completed)
  
  return Disposables.create()
}

let s = PublishSubject<Void>()

s
  .debug()
  .flatMap {
    c
  }
  .do(onNext: { o in
    print("n", o)
  })
  .debug()
  .subscribe()

s.onNext()
s.onNext()

c
  .debug()
  .subscribe()

//: [Next](@next)
