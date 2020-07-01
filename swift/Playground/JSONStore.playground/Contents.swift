import UIKit

public protocol PersistentStorageAdapter {
  
  associatedtype Value
  
  func save(value: Value)
  
  func load() -> Value
  
}

open class PersistentStorage<Adapter: PersistentStorageAdapter> {
  
  public typealias Value = Adapter.Value
  
  public let readWriteQueue = DispatchQueue.init(label: "persistent-storage")
  
  public var value: Value {
    lock.lock(); defer { lock.unlock() }
    return _value
  }
  
  private var _value: Value
  
  private let adapter: Adapter
  private let lock = NSLock()

  init(adapter: Adapter) {
    self.adapter = adapter
    self._value = adapter.load()
  }
  
  public func update(_ perform: (inout Value) -> Void) {
    lock.lock()
    perform(&_value)
    lock.unlock()
    readWriteQueue.async {
      self.adapter.save(value: self.value)
    }
  }
  
  public func load() {
    readWriteQueue.sync {
      self._value = self.adapter.load()
    }
  }
    
}
