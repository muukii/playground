//: [Previous](@previous)

import RxSwift

let source = PublishSubject<Void>()
let m = PublishSubject<Int>()

source
  .debug()
  .subscribe()

source.onNext(())

source.dispose()

source.onNext(())

