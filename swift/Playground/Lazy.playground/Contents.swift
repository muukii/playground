import Cocoa


@propertyWrapper
public final class Lazy<T> {
  
  public typealias Initializer = () -> T
  
  public var wrappedValue: T {
    value
  }
  
  public var projectedValue: Lazy<T> {
    self
  }
  
  public lazy var value: T = self.initializer()
  
  private let initializer: Initializer
  
  public init(_ initializer: @escaping Initializer) {
    self.initializer = initializer
  }
}

class View {
  init() {
    print("init")
  }
}

let object = Lazy { 17 }

object.value

struct Foo {

  @Lazy({ View() }) var value: View
  
  
  func fo () {
    $value
  }
}

let f = Foo()
print("===")
f.value

let la = f.$value

la.value


