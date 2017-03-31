//: [Previous](@previous)

import Foundation

import RxSwift

let s = PublishSubject<Void>()

s.asSingle().subscribe {
  print($0)
}

s.onNext()
s.onCompleted()
s.onNext()

//: [Next](@next)
