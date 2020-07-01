import Foundation

public struct _Mutation<State> {
  
  let mutate: (inout State) -> Void
  
  public init(mutate: @escaping (inout State) -> Void) {
    self.mutate = mutate
  }
}

public struct _Action<State, Operations: OperationsType, ReturnType> where Operations.TargetState == State {
  
  let action: (DispatchContext<State, Operations>) -> ReturnType
  
  public init(action: @escaping (DispatchContext<State, Operations>) -> ReturnType) {
    self.action = action
  }
}

public protocol OperationsType {
  associatedtype TargetState
  
  typealias Mutation = _Mutation<TargetState>
  typealias Action<ReturnType> = _Action<TargetState, Self, ReturnType>
}

public final class DispatchContext<State, Operations: OperationsType> where Operations.TargetState == State {
  
  private let store: StoreBase<State, Operations>
  
  init(store: StoreBase<State, Operations>) {
    self.store = store
  }
  
  public func dispatch<ReturnType>(_ makeAction: (Operations) -> Operations.Action<ReturnType>) -> ReturnType {
    store.dispatch(makeAction)
  }
  
  public func dispatch(_ makeMutation: (Operations) -> Operations.Mutation) {
    store.dispatch(makeMutation)
  }
}

final class Storage<Value> {
  
  var value: Value {
    lock.lock()
    defer {
      lock.unlock()
    }
    return nonatomicValue
  }
  
  private var nonatomicValue: Value
  
  private let lock = NSLock()
  
  init(_ value: Value) {
    self.nonatomicValue = value
  }
  
  func update(_ update: (inout Value) -> Void) {
    lock.lock()
    update(&nonatomicValue)
    lock.unlock()
  }
  
}

public protocol StoreType where Operations.TargetState == State {
  associatedtype State
  associatedtype Operations: OperationsType
  
  func dispatch<ReturnType>(_ makeAction: (Operations) -> Operations.Action<ReturnType>) -> ReturnType
  func dispatch(_ makeMutation: (Operations) -> Operations.Mutation)
}

public class StoreBase<State, Operations: OperationsType>: StoreType where Operations.TargetState == State {
  
  public func dispatch<ReturnType>(_ makeAction: (Operations) -> _Action<Operations.TargetState, Operations, ReturnType>) -> ReturnType {
    fatalError()
  }
  
  public func dispatch(_ makeMutation: (Operations) -> _Mutation<Operations.TargetState>) {
    fatalError()
  }
  
  private var stores: [String : Any] = [:]
  
  func register(store: Any, for key: String) {
    stores[key] = store
  }
}

public final class Store<State, Operations: OperationsType>: StoreBase<State, Operations> where Operations.TargetState == State {
  
  public var state: State {
    storage.value
  }
  
  let storage: Storage<State>
  
  private let operations: Operations
  
  private let lock = NSLock()
  
  public init(
    state: State,
    operations: Operations
  ) {
    self.storage = .init(state)
    self.operations = operations
  }
  
  public override func dispatch<ReturnType>(_ makeAction: (Operations) -> Operations.Action<ReturnType>) -> ReturnType {
    let context = DispatchContext<State, Operations>.init(store: self)
    let action = makeAction(operations)
    let result = action.action(context)
    return result
  }
  
  public override func dispatch(_ makeMutation: (Operations) -> Operations.Mutation) {
    let mutation = makeMutation(operations)
    storage.update { (state) in
      mutation.mutate(&state)
    }
  }
  
  public func makeScoped<ScopedState, ScopedOperations: OperationsType>(
    scope: WritableKeyPath<State, ScopedState>,
    operations: ScopedOperations
  ) -> ScopedStore<State, ScopedState, ScopedOperations> where ScopedOperations.TargetState == ScopedState {
    
    let scopedStore = ScopedStore<State, ScopedState, ScopedOperations>(
      store: self,
      scopeSelector: scope,
      operations: operations
    )
    
    register(store: scopedStore, for: "Key")
    
    return scopedStore
  }
  
}

public final class ScopedStore<SourceState, State, Operations: OperationsType>: StoreBase<State, Operations> where Operations.TargetState == State {
  
  public var state: State {
    storage.value[keyPath: scopeSelector]
  }
  
  private let operations: Operations
  private let storage: Storage<SourceState>
  private let scopeSelector: WritableKeyPath<SourceState, State>
  
  init<SourceOperations: OperationsType>(
    store: Store<SourceState, SourceOperations>,
    scopeSelector: WritableKeyPath<SourceState, State>,
    operations: Operations
  ) {
    
    self.storage = store.storage
    self.operations = operations
    self.scopeSelector = scopeSelector
    
  }
  
  public override func dispatch<ReturnType>(_ makeAction: (Operations) -> Operations.Action<ReturnType>) -> ReturnType {
    let context = DispatchContext<State, Operations>.init(store: self)
    let action = makeAction(operations)
    let result = action.action(context)
    return result
  }
  
  public override func dispatch(_ makeMutation: (Operations) -> Operations.Mutation) {
    let mutation = makeMutation(operations)
    storage.update { (sourceState) in
      mutation.mutate(&sourceState[keyPath: scopeSelector])
    }
  }
}

