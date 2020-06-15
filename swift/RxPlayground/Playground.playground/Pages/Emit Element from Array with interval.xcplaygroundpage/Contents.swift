//: [Previous](@previous)

import Foundation

import RxSwift

Observable<Int>
  .from([1,2,3])
  .concatMap { value -> Observable<Int> in
    Observable.just(value).delay(.seconds(1), scheduler: MainScheduler.instance)
}
.debug()
.subscribe()

Observable<Int>
  .from([1,2,3])
  .concatMap { value -> Observable<Int> in
    Observable.just(value).delay(.seconds(1), scheduler: MainScheduler.instance)
}
.scan([Int]()) { (buf, e) in
  var buf = buf
  buf.append(e)
  return buf
}
.debug()
.subscribe()

//: [Next](@next)
