//: [Previous](@previous)

import RxSwift
import RxCocoa

extension SharedSequenceConvertibleType {
  public func filterLatestFrom<S: SharedSequenceConvertibleType>(_ second: S, _ predicate: @escaping (S.E) -> Bool) -> RxCocoa.SharedSequence<Self.SharingStrategy, Self.E> where Self.SharingStrategy == S.SharingStrategy {

    return withLatestFrom(second) { s, e -> SharedSequence<Self.SharingStrategy, Self.E> in
      if predicate(e) {
        return SharedSequence<Self.SharingStrategy, Self.E>.just(s)
      }
      return SharedSequence<Self.SharingStrategy, Self.E>.empty()
      }
      .merge()
  }
}

extension ObservableType {

  public func filterLatestFrom<S: ObservableConvertibleType>(_ second: S, _ predicate: @escaping (S.E) -> Bool) -> Observable<Self.E> {

    return withLatestFrom(second) { s, e -> Observable<Self.E> in
      if predicate(e) {
        return Observable<Self.E>.just(s)
      }
      return Observable<Self.E>.empty()
      }
      .merge()
  }
}

let source = PublishSubject<Void>()
let isEnabled = Variable(false)

source
  .filter { [weak self] in
    guard let `self` = self else {
      return false // really?
    }
    return self.isEnabled.value == true
}

source
  .filterLatestFrom(isEnabled.asObservable()) { $0 == true }
  .do(onNext: {
    // Through only isEnabled is true
  })

//: [Next](@next)
