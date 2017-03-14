//: [Previous](@previous)

import Foundation

import RxSwift

let s = PublishSubject<Void>()

let o = s.flatMapWithIndex { _, i -> Observable<Void> in
  print(i)
  if i % 5 == 0 {
    return .just()
  } else {
    return .empty()
  }
}

o.debug().subscribe()

s.onNext()
s.onNext()
s.onNext()
s.onNext()
s.onNext()
s.onNext()
s.onNext()
s.onNext()
s.onNext()
s.onNext()
s.onNext()
s.onNext()


//: [Next](@next)
