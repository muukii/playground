//: [Previous](@previous)

import Foundation
import RxSwift

let o: Observable<String> = PublishSubject<String>()

extension ObservableType {

  func asVariable(_ initialValue: E, withDispose: DisposeBag) -> Variable<E> {
    let v = Variable<E>.init(initialValue)
    subscribe { (e) in
      if case .next(let o) = e {
        v.value = o
      }
      }
      .addDisposableTo(withDispose)
    return v
  }
}

//: [Next](@next)
