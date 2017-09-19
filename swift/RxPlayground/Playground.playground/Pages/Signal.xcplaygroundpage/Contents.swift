//: [Previous](@previous)

import RxSwift
import RxCocoa

let source = PublishSubject<Int>()

let d = source.asDriver(onErrorRecover: { _ in .empty() })
let s = source.asSignal(onErrorRecover: { _ in .empty() })

source.onNext(1)

d.debug("First Drive").drive()
s.debug("First Emit ").emit()

source.onNext(2)

d.debug("Second Drive").drive()
s.debug("Second Emit ").emit()

//: [Next](@next)
