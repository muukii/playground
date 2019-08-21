//: [Previous](@previous)

import UIKit
import PlaygroundSupport

enum SegmentKind: Int {
  case vertical
  case horizontal
}

@IBDesignable
class SegmentView: UIView {

  var kind: SegmentKind = .horizontal {
    didSet {
      setNeedsDisplay()
    }
  }
  var color: UIColor = .lightGray {
    didSet {
      setNeedsDisplay()
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.isOpaque = false
    self.backgroundColor = .clear
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.isOpaque = false
    self.backgroundColor = .clear
  }

  override func draw(_ rect: CGRect) {
    // Drawing code
    let path = UIBezierPath()

    path.move(to: rect.height, rect.minX)
    path.addLine(to: rect.width - rect.height, rect.minY)
    path.addLine(to: rect.width - rect.height/2, rect.height/2)
    path.addLine(to: rect.width - rect.height, rect.height)
    path.addLine(to: rect.height, rect.height)
    path.addLine(to: rect.height/2, rect.height/2)

    path.close()
    path.lineWidth = 6

    UIColor.black.setStroke()
    color.setFill()

    path.fill()
    path.stroke()
  }

  func on() {
    self.isHidden = false
  }

  func off() {
    self.isHidden = true
  }
}

private extension UIBezierPath {
  func move(to x: CGFloat, _ y: CGFloat) {
    move(to: CGPoint(x: x, y: y))
  }

  func addLine(to x: CGFloat, _ y: CGFloat) {
    addLine(to: CGPoint(x: x, y: y))
  }
}

let segment = SegmentView.init(frame: .init(x: 0, y: 0, width: 60, height: 300))
PlaygroundPage.current.liveView = segment
