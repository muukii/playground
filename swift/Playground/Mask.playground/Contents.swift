import UIKit

import PlaygroundSupport

class GradientLabel : UIView {

  override class var requiresConstraintBasedLayout: Bool {
    return true
  }

  let innerLabel: UILabel = .init()

  override class var layerClass: AnyClass {
    return CAGradientLayer.self
  }

  private var typedLayer: CAGradientLayer {
    return layer as! CAGradientLayer
  }

  init() {

    super.init(frame: .zero)

    backgroundColor = .red
    self.mask = innerLabel
//    addSubview(innerLabel)
//    innerLabel.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//    innerLabel.frame = bounds

    widthAnchor.constraint(equalTo: innerLabel.widthAnchor, multiplier: 1).isActive = true
    heightAnchor.constraint(equalTo: innerLabel.heightAnchor, multiplier: 1).isActive = true

    typedLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
    typedLayer.startPoint = CGPoint(x: 0, y: 0)
    typedLayer.endPoint = CGPoint(x: 1, y: 1)
    typedLayer.locations = [0, 1]
  }

  override func sizeThatFits(_ size: CGSize) -> CGSize {
    return innerLabel.sizeThatFits(size)
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    innerLabel.frame = bounds
    if innerLabel.preferredMaxLayoutWidth != bounds.width {
      innerLabel.preferredMaxLayoutWidth = bounds.width
      invalidateIntrinsicContentSize()
    }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override var intrinsicContentSize: CGSize {
    return innerLabel.intrinsicContentSize
  }

  override func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
    return innerLabel.systemLayoutSizeFitting(targetSize)
  }

  func performUpdate(_ c: (UILabel) -> Void) {
    c(innerLabel)
    invalidateIntrinsicContentSize()
  }
}

let c = GradientLabel()

let root = UIView(frame: .init(x: 0, y: 0, width: 160, height: 160))
root.backgroundColor = .white

root.addSubview(c)

c.translatesAutoresizingMaskIntoConstraints = false
c.topAnchor.constraint(equalTo: root.topAnchor, constant: 16).isActive = true
c.rightAnchor.constraint(equalTo: root.rightAnchor, constant: -16).isActive = true
//c.bottomAnchor.constraint(equalTo: root.bottomAnchor, constant: -16).isActive = true
c.leftAnchor.constraint(equalTo: root.leftAnchor, constant: 16).isActive = true

c.performUpdate { label in
  label.textColor = .white
  label.numberOfLines = 0
  label.text = "ぶほほほほほぶほほほほほぶほほほほほ"
}

PlaygroundPage.current.liveView = root
