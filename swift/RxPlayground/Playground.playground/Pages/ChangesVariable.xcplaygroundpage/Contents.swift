//: Playground - noun: a place where people can play

import UIKit
import RxSwift
import RxCocoa

public final class ChangesVariable<Element> {

  public typealias E = Element

  // MARK: - Properties

  private let source: Variable<Element>

  public let originalValue: E

  public var value: E {
    get {
      return source.value
    }
    set {
      source.value = newValue
      hasChanges.value = comparer(originalValue, newValue) == false
    }
  }

  public let hasChanges: Variable<Bool>
  public let comparer: (Element, Element) -> Bool

  // MARK: - Initializers

  public init(_ value: Element, comparer: @escaping (Element, Element) -> Bool) {
    self.comparer = comparer
    self.originalValue = value
    self.source = Variable(value)
    self.hasChanges = Variable(false)
  }

  // MARK: - Functions

  public func rollback() {
    value = originalValue
  }

  public func asObservable() -> Observable<E> {
    return source.asObservable()
  }

  public func asDriver() -> Driver<E> {
    return source.asDriver()
  }
}

extension ChangesVariable where Element : Equatable {

  public convenience init(_ value: Element) {
    self.init(value, comparer: { (original: Element, newValue: Element) -> Bool in
      original == newValue
    })
  }
}

extension ObservableType where E : Equatable {

  public func bindTo(_ variable: ChangesVariable<E>) -> Disposable {
    return subscribe { e in
      switch e {
      case let .next(element):
        variable.value = element
      case let .error(error):
        print(error)
      case .completed:
        break
      }
    }
  }
}

let v = ChangesVariable<String>("a") {
  $0 == $1
}

v.hasChanges.asObservable().debug("hasChanges : ").subscribe()
v.asObservable().debug("changes:     ").subscribe()

v.value = "b"
print(v.hasChanges.value)
v.value = "a"
print(v.hasChanges.value)



