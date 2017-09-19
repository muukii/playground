//: [Previous](@previous)

import Foundation

import RxSwift
import RxCocoa

public final class MutableStateVariable<T> {

  public var value: T {
    get {
      return source.value
    }
    set {
      source.value = newValue
    }
  }

  private let source: Variable<T>

  public init(_ value: T) {
    self.source = .init(value)
  }

  public func mutate<Source: ObservableType>(_ execute: @escaping (inout T, Source.E) -> Void) -> (Source) -> Disposable {
    return { source in
      source
        .do(onNext: { [weak self] e in
          guard let `self` = self else { return }
          execute(&self.value, e)
        })
        .subscribe()
    }
  }

  public func asObservable() -> Observable<T> {
    return source.asObservable()
  }

  public func asDriver() -> Driver<T> {
    return source.asDriver()
  }
}

struct State {
  var value1: Int = 0
  var value2: Int = 0
}

//class State : CustomStringConvertible {
//  var value1: Int = 0
//  var value2: Int = 0
//
//  var description: String {
//    return "\(value1), \(value2)"
//  }
//}

let s = PublishSubject<Int>()
let v = MutableStateVariable(State())

v.asObservable().debug().subscribe()

//v.value.value1 = 10
//v.value.value1 = 30

s
  .map { $0 * 2 }
  .bind(to: v.mutate({ (e, b) in
    e.value1 = b
    e.value2 = 10
    e.value2 = 10
    e.value2 = 10
    e.value2 = 10
  }))

s.onNext(10)
s.onNext(30)

//s
//  .map { $0 * 2 }
//  .bind { a in
//    v.value.value1 = 2
//}

//: [Next](@next)
