//: [Previous](@previous)

import Foundation

import RxSwift

let s = [1,2,3]

let o = PublishSubject<[Int]>()
o.flatMap {
  Observable.from($0)
}
.debug()
.subscribe()

o.onNext(s)
o.onNext(s)

//: [Next](@next)
