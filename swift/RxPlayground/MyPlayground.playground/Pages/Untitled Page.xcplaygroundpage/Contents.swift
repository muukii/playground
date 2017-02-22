//: Playground - noun: a place where people can play

import UIKit
import RxSwift

let allCount = Variable<Int>(100)
let offset = Variable<Int>(0)

let remaining = Observable.combineLatest(allCount.asObservable(), offset.asObservable()) {
   $0 - $1
  }
  .distinctUntilChanged()
  .shareReplay(1)

let s = PublishSubject<Void>()

remaining
  .sample(s)
  .debug()
  .subscribe()

remaining
  .sample(s)
  .debug()
  .subscribe()

s.onNext()
offset.value = 1
s.onNext()