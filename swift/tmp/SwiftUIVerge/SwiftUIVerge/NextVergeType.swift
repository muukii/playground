
public protocol NextVergeType {
  
  associatedtype State
  
  /// TODO: Workaround, cannot define `@Storage var state: State { get }`
  var storage: Storage<State> { get }
}

#if canImport(SwiftUI)
import SwiftUI

public extension NextVergeType where Self : BindableObject {
  var didChange: Storage<State>.DidChangePublisher {
    return storage.didChange
  }
}

#endif
