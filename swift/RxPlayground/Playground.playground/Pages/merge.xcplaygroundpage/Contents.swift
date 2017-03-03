//: [Previous](@previous)

import Foundation
import RxSwift

let tapLike = PublishSubject<Void>()

let s2 = PublishSubject<Void>()

Observable.from([tapLike, s2])
  .merge()
  .debug()
  .subscribe()


tapLike.onNext()

s2.onNext()

//: [Next](@next)
