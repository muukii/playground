//: [Previous](@previous)

import RxSwift
import RxCocoa

let o: Observable<Int> = Observable.just(100)

let observer = AnyObserver<Int> { e in
  switch e {
  case .next(let o):
    print(o)
  case .error(let e):
    print(e)
  case .completed:
    break
  }
}

observer.onNext(300)
observer.on(.next(300))
observer.on(.completed)

o.subscribe(observer)


