//: [Previous](@previous)

import Foundation

import RxSwift
import RxCocoa

let start = PublishSubject<Void>()

func run(_ s: Int) -> Observable<Void> {
  return Observable.create { o in
    
    print("run \(s)")
    o.onNext()
    
    return Disposables.create()
  }
}

let order: [Observable<Void>] = [
  start.asObservable(),
  run(0),
  run(1),
  run(2),
]

let s = order
  .dropFirst()
  .reduce(order.first!) { s, n in
    return s.flatMap { n }
}

s.debug().subscribe()

start
  .flatMap { _ -> Observable<Int> in
    print("a")
    return Observable.just(1)
  }
  .flatMap { _ -> Observable<Int> in
    print("a")
    return Observable.just(1)
  }
  .flatMap { _ -> Observable<Int> in
    print("a")
    return Observable.just(1)
  }
  .subscribe()

start.onNext()


//: [Next](@next)
