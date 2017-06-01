//: [Previous](@previous)

import Foundation

import RxSwift

let root = PublishSubject<Int>()

let o1 = Observable<Int>.just(1)
let o2 = Observable<Int>.just(1)
let o3 = Observable<Int>.empty()
let o4 = Observable<Int>.just(3)

root
  .flatMap { _ in
    o1
  }
  .flatMap { _ in
    Observable<Int>.create { o in
//      o.onNext(2)
      o.onCompleted()
      return Disposables.create()
    }
  }
  .flatMap { _ in
    o3
  }
  .flatMap { _ in
    o4
  }
  .debug()
  .subscribe()

root.onNext(1)
root.onNext(2)
//root.onCompleted()

root
  .concatMap { _ in
    Observable<Int>.create { o in
      o.onNext(2)
      return Disposables.create()
    }
  }
  .debug()
  .concatMap { _ in
    Observable<Int>.create { o in
      o.onNext(4)
      return Disposables.create()
    }
  }
  .debug()
  .subscribe()

root.onNext(1)

//: [Next](@next)
