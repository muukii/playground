//: [Previous](@previous)

import UIKit

public protocol PushPresentable {
  
  var pushContext: PushContext { get }
}

public struct PushContext {

  public let viewController: UIViewController
  public init(viewController: UIViewController) {
    self.viewController = viewController
  }

  @discardableResult
  public func push(on navigationController: UINavigationController, animated: Bool = true) {
    navigationController.pushViewController(viewController, animated: animated)
  }
}

public protocol ModalPresentable {
  
  var modalContext: ModalContext { get }
}

public struct ModalContext {

  public let viewController: UIViewController
  /**
   opportunity of embed to containerViewController (e.g UINavigationController)
   */
  public var embedContainer: () -> UIViewController
  private var tweak: (UIViewController) -> Void = { _ in }

  public init<T: UIViewController>(viewController: T, embedContainer: @escaping (T) -> UIViewController = { $0 }) {
    self.viewController = viewController
    self.embedContainer = { embedContainer(viewController) }
  }
  
  public func tweak(_ c: @escaping (UIViewController) -> Void) -> ModalContext {
    
    var s = self
    s.tweak = c
    return s
  }

  public func present(on presentingViewController: UIViewController, animated: Bool, completion: @escaping () -> Void = {}) {

    let controller = embedContainer()
    
    tweak(controller)

    presentingViewController.present(controller, animated: animated, completion: completion)
  }
}

extension PushPresentable where Self : UIViewController {

  public var pushContext: PushContext {
    return PushContext(viewController: self)
  }
}

extension ModalPresentable where Self : UIViewController {

  public var modalContext: ModalContext {
    return ModalContext(viewController: self)
  }
}


class ViewController: UIViewController, PushPresentable, ModalPresentable {

  var modalContext: ModalContext {
    return ModalContext(viewController: self, embedContainer: {
      UINavigationController(rootViewController: $0)
    })
  }
}



let b = UIViewController()
let n = UINavigationController()
let v = ViewController()

v.pushContext.push(on: n, animated: true)
v.modalContext.present(on: b, animated: true)


//: [Next](@next)
