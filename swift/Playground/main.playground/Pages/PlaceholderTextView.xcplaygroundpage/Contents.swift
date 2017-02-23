//: [Previous](@previous)

import UIKit
import PlaygroundSupport

extension UITextView {

  // MARK: - Properties

  private struct StoredProperties {
    static var placeholderLabel: Void?
  }

  private var placeholderLabel: UILabel? {
    get {
      let value = objc_getAssociatedObject(self, &StoredProperties.placeholderLabel) as? UILabel
      return value
    }
    set {
      objc_setAssociatedObject(self,
                               &StoredProperties.placeholderLabel,
                               newValue,
                               objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }

  // MARK: - Functions

  public func setPlaceholder(attribute: NSAttributedString) {

    guard placeholderLabel == nil else {
      return
    }

    configurePlaceholder(attribute: attribute)

    NotificationCenter.default
      .addObserver(forName: NSNotification.Name.UITextViewTextDidChange,
                   object: nil,
                   queue: nil,
                   using: { [weak self] _ in

                    guard let `self` = self else { return }
                    self.placeholderLabel?.isHidden = !self.text.isEmpty
      })
  }

  private func configurePlaceholder(attribute: NSAttributedString) {

    guard placeholderLabel == nil else {
      return
    }

    let label: UILabel = .init()
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    label.isHidden = !text.isEmpty
    label.attributedText = attribute

    addSubview(label)

    label.topAnchor
      .constraint(equalTo: layoutMarginsGuide.topAnchor)
      .isActive = true
    label.leadingAnchor
      .constraint(equalTo: layoutMarginsGuide.leadingAnchor)
      .isActive = true
    label.trailingAnchor
      .constraint(equalTo: layoutMarginsGuide.trailingAnchor)
      .isActive = true
    label.bottomAnchor
      .constraint(lessThanOrEqualTo: layoutMarginsGuide.bottomAnchor)
      .isActive = true

    placeholderLabel = label
  }

  private func textDidChange() {

  }
}

let textView = UITextView(frame: .init(x: 0, y: 0, width: 300, height: 300))
textView.setPlaceholder(attribute: NSAttributedString(string: "Placeholder"))

PlaygroundPage.current.liveView = textView
//: [Next](@next)
