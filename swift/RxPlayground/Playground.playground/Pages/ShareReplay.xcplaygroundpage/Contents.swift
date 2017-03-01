//: [Previous](@previous)

import Foundation

import RxSwift

let o = Observable<Int>.create { o in

  print("aaa")
  o.onNext(10)
  o.onCompleted()

  return Disposables.create()
}
.shareReplay(1)

o.debug().subscribe()
o.debug().subscribe()


//: [Next](@next)
