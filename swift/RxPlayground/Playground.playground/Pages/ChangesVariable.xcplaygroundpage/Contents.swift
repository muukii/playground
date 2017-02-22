//: Playground - noun: a place where people can play

import UIKit
import RxSwift
import RxCocoa

public final class ChangesVariable<Element: Equatable> {

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
    }
  }

  public let hasChanges: Variable<Bool>

  // MARK: - Initializers

  public init(_ value: Element) {
    self.originalValue = value
    self.source = Variable(value)
    self.hasChanges = Variable(false)

    self.source.asObservable()
      .map { value != $0 }
      .subscribe(onNext: { [unowned self] in
        self.hasChanges.value = $0
      })
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

extension ObservableType where E : Equatable {

  public func bindTo(_ variable: ChangesVariable<E>) -> Disposable {
    return subscribe { e in
      switch e {
      case let .next(element):
        variable.value = element
      case let .error(error):
        let error = "Binding error to variable: \(error)"
        #if DEBUG
          rxFatalError(error)
        #else
          print(error)
        #endif
      case .completed:
        break
      }
    }
  }
}

let v = ChangesVariable<String>("a")

v.hasChanges.asObservable().debug("hasChanges : ").subscribe()
v.asObservable().debug("changes:     ").subscribe()

v.value = "b"
print(v.hasChanges.value)
v.value = "a"
print(v.hasChanges.value)



