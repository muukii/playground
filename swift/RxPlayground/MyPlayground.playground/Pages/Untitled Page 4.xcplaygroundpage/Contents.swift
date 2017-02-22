//: [Previous](@previous)

import Foundation

import RxSwift

let v1 = Variable(false)
let v2 = Variable(false)
let v3 = Variable(false)

Observable.combineLatest(<#T##collection: Collection##Collection#>, <#T##resultSelector: ([C.Iterator.Element.E]) throws -> Element##([C.Iterator.Element.E]) throws -> Element#>)

Observable.from([v1.asObservable(), v2.asObservable(), v3.asObservable()]).debug().subscribe()

Observable.zip([v1.asObservable(), v2.asObservable(), v3.asObservable()]) { $0 }
  .debug()
  .subscribe()

v1.value = true
