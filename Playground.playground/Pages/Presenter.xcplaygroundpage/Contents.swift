//: [Previous](@previous)

import UIKit

public protocol PushPresentable {

  associatedtype ViewController : UIViewController
  var pushContext: PushContext<ViewController> { get }
}

public struct PushContext<T: UIViewController> {

  public let viewController: T
  public init(viewController: T) {
    self.viewController = viewController
  }

  @discardableResult
  public func push(on navigationController: UINavigationController, animated: Bool = true) -> T {
    navigationController.pushViewController(viewController, animated: animated)
    return viewController
  }
}

public protocol ModalPresentable {

  associatedtype ViewController : UIViewController
  var modalContext: ModalContext<ViewController> { get }
}

public struct ModalContext<T: UIViewController> {

  public let viewController: T
  /**
   opportunity of embed to containerViewController (e.g UINavigationController)
   */
  public var embedContainer: (T) -> UIViewController

  public init(viewController: T, embedContainer: @escaping (T) -> UIViewController = { $0 }) {
    self.viewController = viewController
    self.embedContainer = embedContainer
  }

  @discardableResult
  public func present(on presentingViewController: UIViewController, animated: Bool, completion: @escaping () -> Void = {}) -> T {

    let controller = embedContainer(viewController)

    presentingViewController.present(controller, animated: animated, completion: completion)

    return viewController
  }
}


extension PushPresentable where Self : UIViewController {

  public var pushContext: PushContext<Self> {
    return PushContext(viewController: self)
  }
}

extension ModalPresentable where Self : UIViewController {

  public var modalContext: ModalContext<Self> {
    return ModalContext(viewController: self)
  }
}


class ViewController: UIViewController, PushPresentable, ModalPresentable {

  var modalContext: ModalContext<ViewController> {
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
