//: [Previous](@previous)

import SwiftUI

@propertyWrapper
public final class Atomic<T> {
  
  private let lock: NSLock = .init()
  
  public var wrappedValue: T {
    get {
      lock.lock(); defer { lock.unlock() }
      return _value
    }
    set {
      lock.lock(); defer { lock.unlock() }
      _value = newValue
    }
  }
  
  private var _value: T
  
  public init(wrappedValue value: T) {
    self._value = value
  }
}


final class Store<State, Reducer: ReducerType>: ObservableObject {
  
  @Atomic var state: State
  
  init(_ initialState: State) {
    self.state = initialState
  }
  
}

final class StoreRef<State, Reducer: ReducerType> {
  
  init<Source, Reducer>(source: Store<Source, Reducer>, selector: WritableKeyPath<Source, State>) {
    
  }
}

protocol ReducerType {
  
}

struct State {
  
  var value1: String = ""
  
  struct DomainA {
    
    var value1: String = ""
  }
  
  var domainA: DomainA = .init()
  
}

struct Reducer: ReducerType {
  
}


class Sample {
    
  @ObservedObject var store: Store<State, Reducer> = .init(.init())
  
  func run() {
    StoreRef<State.DomainA, Reducer>.init(source: store, selector: \.domainA)
  }
  
}

let s = Sample()
s.run()



//: [Next](@next)
