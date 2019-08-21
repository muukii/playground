import UIKit

import PlaygroundSupport

let rootView = UIView()

rootView.frame = .init(x: 0, y: 0, width: 300, height: 300)

rootView.backgroundColor = .white


class CardView : UIView {

  private let containerView = UIView()

  override init(frame: CGRect) {
    super.init(frame: frame)

    backgroundColor = .white

    addSubview(containerView)
    containerView.frame = bounds
    containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

    layer.cornerRadius = 16

    containerView.backgroundColor = .gray

    containerView.layer.cornerRadius = 16
    containerView.clipsToBounds = true

    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.9
    layer.shadowRadius = 10
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    let path = UIBezierPath(roundedRect: bounds, cornerRadius: 16)

    layer.shadowPath = path.cgPath
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

let card = CardView()

card.frame = .init(x: 30, y: 30, width: 200, height: 200)

rootView.addSubview(card)

PlaygroundPage.current.liveView = rootView
