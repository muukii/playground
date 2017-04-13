//: [Previous](@previous)

import Foundation

import RxSwift
import RxCocoa

let s = Single.just(1)

s
//  .asObservable()
//  .debug()
  .flatMap { v in
    Single<Int>.create { o in
//      o(.success(4))
      return Disposables.create {
        print("d")
      }
    }
  }
  .debug()
  .subscribe()


//: [Next](@next)
