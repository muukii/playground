//: [Previous](@previous)

import RxSwift

let task = Single<Int>.error("")

task
  .do(onDispose: { print("dispose")})
  .debug().subscribe()

//: [Next](@next)
