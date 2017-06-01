//: [Previous](@previous)

import UIKit
import PlaygroundSupport

class View: UIView {
  
  let label = UILabel()
  
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
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

let view = View()
view.label.text = "00000000000283456938476813450"

view.systemLayoutSizeFitting(
  CGSize(width: 100.0, height: UILayoutFittingCompressedSize.height),
  withHorizontalFittingPriority: UILayoutPriorityRequired,
  verticalFittingPriority: UILayoutPriorityFittingSizeLevel
)

print(UILayoutFittingCompressedSize) // (0.0, 0.0)
print(UILayoutFittingExpandedSize) // (10000.0, 10000.0)

PlaygroundPage.current.liveView = view

//: [Next](@next)
