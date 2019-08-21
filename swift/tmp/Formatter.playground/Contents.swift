import UIKit

extension UIEdgeInsets {

  public init(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0, dummy: Void = ()) {
    self.init(top: top, left: left, bottom: bottom, right: right)
  }

  public init(all inset: CGFloat) {
    self.init(top: inset, left: inset, bottom: inset, right: inset)
  }
}

UIEdgeInsets(top: 2)

