//
//  ViewController.swift
//  PinFlexLayoutPlayground
//
//  Created by muukii on 11/14/17.
//  Copyright © 2017 muukii. All rights reserved.
//

import UIKit

import FlexLayout

class ViewController: UIViewController {

  let listView: UIView = .init()

  private let views = (0..<10).map { i in InterestCell.init(image: nil, title: i.description) }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    let label = UILabel()

    label.text = "hoge"
    label.numberOfLines = 0

    let con = UIView()

    con.flex.addItem(label)

//    let v = FlexWrapperView.init(embeddedView: listView)

    listView.frame.size = .init(width: 100, height: 100)
    view.addSubview(listView)

    listView
      .flex
      .direction(.row)
      .wrap(.wrap)
      .define { flex in

        views.forEach { i in
          flex.addItem(i)
            .grow(0)
            .shrink(0)
        }
    }


    listView.flex.layout()

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {

      self.listView.flex.layout()
    }

//    NSLayoutConstraint.activate([
//      v.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//      v.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//      v.widthAnchor.constraint(equalToConstant: 120),
////      v.heightAnchor.constraint(equalToConstant: 400),
//      ])

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }
}

final class FlexWrapperView : UIView {

  override class var requiresConstraintBasedLayout: Bool {
    return true
  }

  private var oldSize: CGSize?

  private var width: NSLayoutConstraint!
  private var height: NSLayoutConstraint!

  let embeddedView: UIView

  init(embeddedView: UIView) {

    self.embeddedView = embeddedView

    super.init(frame: .zero)

    addSubview(embeddedView)

    self.translatesAutoresizingMaskIntoConstraints = false

    width = widthAnchor.constraint(equalToConstant: 0)
    width.priority = .defaultLow
    width.isActive = true

    height = heightAnchor.constraint(equalToConstant: 0)
    height.priority = .defaultLow
    height.isActive = true

  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override var intrinsicContentSize: CGSize {
    return flex.intrinsicSize
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    let currentSize = self.frame.size

    embeddedView.frame = bounds

    if oldSize != currentSize {
      defer {
        oldSize = currentSize
      }

      embeddedView.flex.layout()

      DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
        self.embeddedView.flex.layout()
      }
    }
  }

  override func updateConstraints() {
    super.updateConstraints()

    print(flex.intrinsicSize)

    let size = flex.intrinsicSize

//    print("updateConstraints", frame)
  }

  override func sizeThatFits(_ size: CGSize) -> CGSize {
    let size = super.sizeThatFits(size)
    return size
  }

  override func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
    fatalError()
  }

  override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
    fatalError()
  }

}


private final class InterestCell : UIView {

  private let imageView: UIImageView = .init()

  private let label: UILabel = .init()

  init(image: UIImage?, title: String = "") {

    super.init(frame: .zero)

    backgroundColor = UIColor.init(white: 0.98, alpha: 1)

    label.text = title

    flex
      .direction(.column)
      .define {

        $0.addItem(imageView)
          .size(50)

        $0.addItem(label)
          .grow(0)
          .shrink(0)

      }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
//    flex.layout()
//    print(frame)
  }
}

final class CustomLabel: UILabel {

  override var intrinsicContentSize: CGSize {
//    print("intrinsicContentSize", super.intrinsicContentSize)
    return super.intrinsicContentSize
  }

  override func sizeToFit() {
    super.sizeToFit()
  }

  override func sizeThatFits(_ size: CGSize) -> CGSize {
    return super.sizeThatFits(size)
  }
}
