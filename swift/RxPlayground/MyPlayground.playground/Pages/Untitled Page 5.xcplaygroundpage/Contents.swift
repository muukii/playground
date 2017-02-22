//: [Previous](@previous)

import Foundation
import RxSwift
import RxCocoa

let s = PublishSubject<Bool>()

let bool = Observable.just(false)

s.debug().subscribe()

s.onNext(true)
s.onCompleted()
s.onNext(false)




//: [Next](@next)
