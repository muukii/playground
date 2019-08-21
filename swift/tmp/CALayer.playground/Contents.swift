import UIKit
import PlaygroundSupport

let container = UIView.init(frame: .init(x: 0, y: 0, width: 400, height: 400))
container.backgroundColor = .white

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

let view = UIView.init(frame: .init(x: 0, y: 0, width: 80, height: 40))

do {

  view.backgroundColor = UIColor(white: 0.15, alpha: 1)
  view.layer.cornerRadius = 8
  view.layer.updateModernShadow(shadowColor: .black)

  container.addSubview(view)
  view.frame.origin = .init(x: 160, y: 30)
}

let scale = UIScreen.main.scale
let padding = UIEdgeInsets(top: 32, left: 32, bottom: 32, right: 32)

var size = view.bounds.size
size.width += padding.left + padding.right
size.height += padding.top + padding.bottom

let renderer = UIGraphicsImageRenderer(bounds: .init(origin: .zero, size: size))

let image = renderer.image { (context) in
  context.cgContext.translateBy(x: padding.left, y: padding.top)

  UIColor.blue.setFill()
  context.fill(CGRect.init(x: 0, y: 0, width: 300, height: 300))
  view.drawHierarchy(in: CGRect(origin: .zero, size: view.bounds.size), afterScreenUpdates: true)
//  view.layer.render(in: context.cgContext)
}

let c = UIView(frame: CGRect(origin: .zero, size: size))
c.layer.contents = image.cgImage!
c.layer.contentsScale = scale
c.layer.contentsGravity = .center

container.addSubview(c)
c.frame.origin = .init(x: 160, y: 130)

PlaygroundPage.current.liveView = container

