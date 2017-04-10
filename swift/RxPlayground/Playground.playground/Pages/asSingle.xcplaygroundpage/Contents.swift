//: [Previous](@previous)

import Foundation

import RxSwift

extension String: Error {

}

let single = Observable<Int>.create { o in
  print("run")
  o.onNext(2)
  o.onCompleted()

  return Disposables.create()
}

let error = Observable<Int>.create { o in

  o.onError("")

  return Disposables.create()
}

single
  .subscribe { e in
    print(e)
}

single
  .asMaybe()
  .subscribe { e in
    print(e)
}

error
  .asSingle()
  .subscribe { e in
    print(e)
}


/*:

 */

let s = PublishSubject<Int>()

s.asSingle().debug().subscribe()

s.onNext(3)
s.onCompleted()


//: [Next](@next)
