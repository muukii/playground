//: [Previous](@previous)

import Foundation

import RxSwift

extension String : Error {

}

let tap = PublishSubject<Int>()

tap
  .flatMap { n -> Observable<Int> in
    Observable<Int>.create { o in
      o.onError("Error")
      return Disposables.create()
      }
//      .catchError { _ in
//        return .empty()
//      }
//      .debug("        ")
  }
  .catchError { _ in
    return .empty()
  }
  .debug("<<<")
  .subscribe()

tap.onNext(3)
tap.onNext(4)
tap.onNext(6)
tap.onNext(8)


//: [Next](@next)
