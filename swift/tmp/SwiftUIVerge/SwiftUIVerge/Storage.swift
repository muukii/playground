import Combine

/// Use with @ObjectBinding in View
@propertyDelegate public final class Storage<T> {
  
  public typealias DidChangePublisher = PassthroughSubject<T, Never>
  
  public let didChange: DidChangePublisher = .init()
  
  private let lock: NSRecursiveLock = .init()
  
  @SwiftUIVergeAtomic private(set) public var value: T
  
  public init(initialValue value: T) {
    self.value = value
  }
  
  public func commit(_ mutation: (inout T) -> Void) {
    lock.lock()
    var v = value
    mutation(&v)
    value = v
    lock.unlock()
    didChange.send(v)
  }
  
}

