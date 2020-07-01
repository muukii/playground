import UIKit

extension UIViewController {
  func accept(_ visitor: UIKitVisitor) {
    visitor.visit(self)
    self.view.accept(visitor)
    children.forEach {
      $0.accept(visitor)
    }
    presentedViewController?.accept(visitor)

  }
}

extension UIView {
  func accept(_ visitor: UIKitVisitor) {
    if let window = self as? UIWindow {
      visitor.visit(window)
      window.rootViewController?.accept(visitor)
    } else {
      visitor.visit(self)
    }
    subviews.forEach {
      $0.accept(visitor)
    }
    layer.accept(visitor)
  }
}

extension CALayer {
  func accept(_ visitor: UIKitVisitor) {
    visitor.visit(self)
    sublayers?.forEach {
      $0.accept(visitor)
    }
  }
}

class UIKitVisitor {
  
  func visit(_ viewController: UIViewController) {
    
  }
  
  func visit(_ view: UIWindow) {
    
  }
    
  func visit(_ view: UIView) {
        
  }
  
  func visit(_ layer: CALayer) {
    
  }
}
