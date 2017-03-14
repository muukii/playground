//: [Previous](@previous)

import RxSwift
import RxCocoa

let tap = PublishSubject<Void>()

tap.subscribe(onNext: { _ in
  print("tap1")
})

tap.subscribe(onNext: { _ in
  print("tap2")
})

tap.subscribe(onNext: { _ in
  print("tap3")
})

tap.onNext()
tap.onNext()
tap.onNext()
