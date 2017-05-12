//: [Previous](@previous)

import Foundation
import RxSwift
import RxCocoa

let s = Single.just(1)

s.debug().subscribe()

s.asObservable().shareReplay(1).asSingle().debug().subscribe()

//: [Next](@next)
