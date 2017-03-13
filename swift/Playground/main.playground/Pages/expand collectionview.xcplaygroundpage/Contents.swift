//: [Previous](@previous)

import UIKit

class ExpandingCollectionView: UICollectionView {

  override var contentSize: CGSize {
    didSet {
      invalidateIntrinsicContentSize()
    }
  }

  override var intrinsicContentSize: CGSize {
    return CGSize(width: UIViewNoIntrinsicMetric, height: self.contentSize.height)
  }
}

//: [Next](@next)
