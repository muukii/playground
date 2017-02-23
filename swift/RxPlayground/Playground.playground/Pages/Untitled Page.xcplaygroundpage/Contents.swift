//: [Previous](@previous)

import Foundation

import RxSwift
import RxCocoa

extension String : Error {

}

let s = PublishSubject<Void>()

let a = s
  .flatMap {
    Observable<Int>.create { o in
//      o.onNext(3)
      o.onError("error")
      return Disposables.create()
      }
      .catchError { _ in
        return .empty()
    }
    .debug()
  }
//  .debug()
  .subscribe()

s.onNext()

//: [Next](@next)
