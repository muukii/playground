//: [Previous](@previous)

import Foundation

import RxSwift

let o = Observable<Int>.create { o in

  o.onNext(2)
  o.onCompleted()

  return Disposables.create()
}

o
//  .debug()
  .asSingle()
  .subscribe { e in
    print(e)
}

o
//  .debug()
  .asMaybe()
  .subscribe { e in
    print(e)
}

//: [Next](@next)
