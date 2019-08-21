import UIKit
import PlaygroundSupport

let container = UIView.init(frame: .init(x: 0, y: 0, width: 400, height: 400))
container.backgroundColor = .white

do {
  let view = UIView.init(frame: .init(x: 0, y: 0, width: 80, height: 40))

  view.backgroundColor = UIColor(white: 0.15, alpha: 1)

  view.layer.shadowColor = UIColor.black.cgColor
  view.layer.shadowRadius = 6
  view.layer.shadowOffset = .init(width: 0, height: 6)
  view.layer.shadowOpacity = 0.3
  view.clipsToBounds = false
  view.layer.cornerRadius = 8

  container.addSubview(view)
  view.frame.origin = .init(x: 30, y: 30)
}

extension CALayer {

  public func updateModernShadow(shadowColor: UIColor) {

    self.shadowColor = shadowColor.cgColor
    self.shadowRadius = 10
    self.shadowOffset = .init(width: 0, height: 6)
    self.shadowOpacity = 0.9
    self.masksToBounds = false
    self.shadowPath = UIBezierPath(rect: bounds.insetBy(dx: 10, dy: 10)).cgPath

  }
}

do {
  let view = UIView.init(frame: .init(x: 0, y: 0, width: 80, height: 40))

  view.backgroundColor = UIColor(white: 0.15, alpha: 1)
  view.layer.cornerRadius = 8
  view.layer.updateModernShadow(shadowColor: .black)

  container.addSubview(view)
  view.frame.origin = .init(x: 160, y: 30)
}

PlaygroundPage.current.liveView = container

