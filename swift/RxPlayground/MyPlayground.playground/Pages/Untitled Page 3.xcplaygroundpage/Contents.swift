//: [Previous](@previous)

import Foundation
import RxSwift

let s = PublishSubject<Observable<Int>>()
s.flatMapFirst { $0 }.debug().subscribe()

func create() -> Observable<Int> {
  return .just(1)
}

s.onNext(create())

//: [Next](@next)
