import Foundation

public func after(_ seconds: Int, _ closure: @escaping () -> Void) {
  DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(seconds), execute: {
    closure()
  })
}

extension String: Error {
  
}
