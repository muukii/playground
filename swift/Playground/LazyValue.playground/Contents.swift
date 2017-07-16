//: Playground - noun: a place where people can play

import Foundation

public struct LazyValue<T> {
  
  private let eval: () -> T
  
  public var value: T {
    return eval()
  }
  
  public init(_ eval: @autoclosure @escaping () -> T) {
    self.eval = eval
  }
  
  public init(_ eval: @escaping () -> T) {
    self.eval = eval
  }
  
  public func map<U>(_ transform: @escaping (T) -> U) -> LazyValue<U> {
    return LazyValue<U> {
      transform(self.value)
    }
  }
  
  public func flatMap<U>(_ transform: @escaping (T) -> LazyValue<U>) -> LazyValue<U> {
    
    return LazyValue<U> {
      transform(self.value).value
    }
  }

//  public func flatMap<U, S>(_ transform: @escaping (S) -> U) -> LazyValue<U?> where T == Optional<S> {
//    
//    return LazyValue<U?> {
//      switch self.value {
//      case .none:
//        return nil
//      case .some(let v):
//        return transform(v)
//      }
//    }
//  }
}

public func == <T: Equatable>(lhs: LazyValue<T>, rhs: LazyValue<T>) -> Bool {
  
  return lhs.value == rhs.value
}

let a = ["a"]
let b = a
  .lazy
  .map { $0.count }

b.first
b.first

do {
  let value = LazyValue(3)
  
  let m = value
    .map { $0 * 3 }
    .map { String($0) }
    .map { $0.count }
  
  m.value
}

do {
  
  let v = LazyValue("32")
    .flatMap { LazyValue(Int($0)) }
}

do {
  
  LazyValue(Optional(3))
}
