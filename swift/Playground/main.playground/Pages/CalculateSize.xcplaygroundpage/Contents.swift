//: [Previous](@previous)

import UIKit
import PlaygroundSupport

extension UIView {

  func calculateCompressedSize(withMaxWidth: CGFloat?, maxHeight: CGFloat?) -> CGSize {
    
    let targetSize = CGSize(
      width: withMaxWidth ?? UILayoutFittingCompressedSize.width,
      height: maxHeight ?? UILayoutFittingCompressedSize.height
    )
    
    let horizontalPriority = withMaxWidth == nil ? UILayoutPriority.fittingSizeLevel : UILayoutPriority.required
    let verticalPriority = maxHeight == nil ? UILayoutPriority.fittingSizeLevel : UILayoutPriority.required
    
    let size = systemLayoutSizeFitting(
      targetSize,
      withHorizontalFittingPriority: horizontalPriority,
      verticalFittingPriority: verticalPriority
    )
    
    return size
  }
}

class MyLabel: UILabel {
  
  override class var requiresConstraintBasedLayout: Bool {
//    return false
    return true
  }
  
  override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
    print("[MyLabel] textRect \(bounds), numberOfLines: \(numberOfLines)")
    return super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
  }
  
  override func sizeThatFits(_ size: CGSize) -> CGSize {
    print("[MyLabel] sizeThatFits", size)
    return super.sizeThatFits(size)
  }
  
  override var intrinsicContentSize: CGSize {
    let size = super.intrinsicContentSize
    print("[MyLabel] intrinsicContentSize", size)
    return size
  }
  
  override var preferredMaxLayoutWidth: CGFloat {
    get {
      let width = super.preferredMaxLayoutWidth
      print("[MyLabel] get preferredMaxLayoutWidth", width)
      return width
    }
    set {
      print("[MyLabel] set preferredMaxLayoutWidth", newValue)
      super.preferredMaxLayoutWidth = newValue
    }
  }
}

/*:
 Label
 */
let label = MyLabel()

label.text = "Hiroshi Kimura"
label.numberOfLines = 0

label.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
label.systemLayoutSizeFitting(UILayoutFittingExpandedSize)

label.systemLayoutSizeFitting(
  CGSize(width: 1, height: UILayoutFittingCompressedSize.height),
  withHorizontalFittingPriority: UILayoutPriority.fittingSizeLevel,
  verticalFittingPriority: UILayoutPriority.fittingSizeLevel
)


let size = label.calculateCompressedSize(withMaxWidth: 50, maxHeight: 50)
size

print("")

/*:
 View
 */

class MyView: UIView {
  
  let label = MyLabel()
  
  init() {
    super.init(frame: .zero)

    label.translatesAutoresizingMaskIntoConstraints = false
    addSubview(label)
    
    label.numberOfLines = 0

    label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8).isActive = true
    label.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
    label.rightAnchor.constraint(equalTo: rightAnchor, constant: 8).isActive = true
    label.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
  }
  
  override func sizeThatFits(_ size: CGSize) -> CGSize {
    print("[MyView] sizeThatFits", size)
    return super.sizeThatFits(size)
  }
  
  override var intrinsicContentSize: CGSize {
    let size = super.intrinsicContentSize
    print("[MyView] intrinsicContentSize", size)
    return size
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

let view = MyView()
view.label.text = "Hiroshi Kimura"

view.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
view.systemLayoutSizeFitting(UILayoutFittingExpandedSize)

view.systemLayoutSizeFitting(
  CGSize(width: 50.0, height: UILayoutFittingCompressedSize.height),
  withHorizontalFittingPriority: UILayoutPriority.required,
  verticalFittingPriority: UILayoutPriority.fittingSizeLevel
)

//print(UILayoutFittingCompressedSize) // (0.0, 0.0)
//print(UILayoutFittingExpandedSize) // (10000.0, 10000.0)

//: [Next](@next)
