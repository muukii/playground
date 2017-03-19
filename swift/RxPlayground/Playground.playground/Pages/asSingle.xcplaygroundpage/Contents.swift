//: [Previous](@previous)

import Foundation

import RxSwift

extension String: Error {

}

let next = Observable<Int>.create { o in
  print("run")
  o.onNext(2)
  o.onCompleted()

  return Disposables.create()
}
.shareReplay(1)

let error = Observable<Int>.create { o in

  o.onError("")

  return Disposables.create()
}

next
  .asSingle()
  .subscribe { e in
    print(e)
}

next
  .asMaybe()
  .subscribe { e in
    print(e)
}


error
  .asSingle()
  .subscribe { e in
    print(e)
}



//: [Next](@next)
