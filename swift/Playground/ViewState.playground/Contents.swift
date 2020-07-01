import UIKit

@propertyWrapper
public struct ViewState<T> {
  
  public static subscript<EnclosingSelf: UIView, TargetValue>(
    _enclosingInstance instance: EnclosingSelf,
    wrapped wrappedKeyPath: ReferenceWritableKeyPath<EnclosingSelf, TargetValue>,
    storage storageKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Self>
  ) -> T {
    get {
      
      let value = instance[keyPath: storageKeyPath].wrappedValue
      return value
    }
    set {
      instance[keyPath: storageKeyPath].wrappedValue = newValue
      instance.setNeedsLayout()
    }
  }
  
  public var wrappedValue: T
  
  public var projectedValue: ViewState<T> {
    self
  }
  
  public init(wrappedValue: T) {
    self.wrappedValue = wrappedValue
  }
  
}

class MyView: UIView {
  
  @ViewState var count: Int = 0
  
  override func setNeedsLayout() {
    print("Called SetNeedsLayout")
    super.setNeedsLayout()
  }
  
}


let view = MyView()
view.count
view.count = 1
view.count
