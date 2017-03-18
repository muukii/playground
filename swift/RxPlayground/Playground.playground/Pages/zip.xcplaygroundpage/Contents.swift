//: [Previous](@previous)

import RxSwift
import RxCocoa

extension String: Error {

}

let a = PublishSubject<Void>()
let b = PublishSubject<Void>()

let zipped = Observable.zip(a, b) { $0 }.asMaybe()

zipped
  .catchError { _ in
    return .empty()
  }
  .subscribe { (e) in
    print(e)
}

a.onNext()
b.onNext()

a.onError("")

//: [Next](@next)
