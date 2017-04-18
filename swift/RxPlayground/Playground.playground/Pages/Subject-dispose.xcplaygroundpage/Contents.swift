//: [Previous](@previous)

import Foundation

import RxSwift

let s = PublishSubject<Void>()

let d = PublishSubject<Void>()

s.debug().subscribe(d)

d.dispose()
d.isDisposed

s.onNext()

//: [Next](@next)
