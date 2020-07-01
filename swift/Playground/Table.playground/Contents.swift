import Cocoa

@propertyWrapper
public struct Selector {
  
  public static subscript<EnclosingSelf: BackingDatabase, TargetValue>(
    _enclosingInstance instance: EnclosingSelf,
    wrapped wrappedKeyPath: ReferenceWritableKeyPath<EnclosingSelf, TargetValue>,
    storage storageKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Self>
  ) -> [Any]? {
    get {
            
      let key = instance[keyPath: storageKeyPath].key
      let value = instance.storage[key]
      return value as? [Any]
    }
    set {
      let key = instance[keyPath: storageKeyPath].key
      instance.storage[key] = newValue
    }
  }
  
  @available(*, unavailable)
  public var wrappedValue: [Any]? {
    get { fatalError() }
    set { fatalError() }
  }
  private let key: String
    
  public init(key: String) {
    self.key = key
  }
  
}

public final class BackingDatabase {
  
  @Selector(key: "Hello") var foo
  
  var storage: [AnyHashable : Any] = [:]
}

let s = BackingDatabase()

s.foo = ["abc"]

print(s.foo)

public struct Database {
    
}
