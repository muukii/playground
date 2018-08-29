//: [Previous](@previous)

import RxSwift
import RxCocoa

var count = 0

let task = Single<Int>.create { o in

  print("RUN")
  count += 1
  if count == 4 {
    o(.success(2))
  } else {
    o(.error("MyError"))
  }

  return Disposables.create()
}


task
  .flatMap { _ in
    Single<Int>.create { o in

      print("RUN")
      o(.success(2))

      return Disposables.create()
    }
  }
  .retryWhen { e -> Observable<Void> in
    e
      .enumerated()
      .flatMap { index, error -> Observable<Void> in
        if index < 3 {
          return Observable.error(error)
        }
        return Observable.just(())
    }
  }
  .debug()
  .subscribe()

//: [Next](@next)
