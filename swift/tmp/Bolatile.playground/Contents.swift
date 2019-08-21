
public final class Transient<T : AnyObject> {
  
  private let factory: () -> T
  
  private weak var reserved: T?
  private(set) public var retained: T?
  
  init(_ factory: @escaping () -> T) {
    self.factory = factory
  }
  
  public func make() -> T {
    let object = factory()
    retained = object
    return object
  }
  
  public func release() {
    retained = nil
  }
}
