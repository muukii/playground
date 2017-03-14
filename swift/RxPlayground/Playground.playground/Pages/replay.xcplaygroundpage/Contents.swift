//: [Previous](@previous)

import Foundation

import RxSwift

extension String: Error {

}

let next = Observable<Int>.create { o in

  o.onNext(2)
  o.onCompleted()
  print("on")

  return Disposables.create()
  }
  .shareReplay(1)

//next.debug().subscribe()
//next.debug().subscribe()
//next.debug().subscribe()


//: [Next](@next)
