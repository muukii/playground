//: [Previous](@previous)

import Foundation

import RxSwift

let s = PublishSubject<Void>()

s.debug().subscribe()

let a = PublishSubject<Void>()

a.take(1)
  .subscribe(s)

a.onNext()

s.onNext()

//: [Next](@next)
