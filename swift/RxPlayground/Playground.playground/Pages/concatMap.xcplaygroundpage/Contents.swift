//: [Previous](@previous)

import Foundation

import RxSwift

let o = Observable.just(3)

o.concatMap { n in
  return Observable.just("")
}

o.concat(Observable.just(3))


//: [Next](@next)
