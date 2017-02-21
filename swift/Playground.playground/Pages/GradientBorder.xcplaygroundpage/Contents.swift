//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport

let drawer = LinearGradientDrawer(
  descriptor: .init(
    locationAndColors: [
      (0, UIColor.red),
      (1, UIColor.blue),
      ],
    startPoint: CGPoint(x: 0, y: 0),
    endPoint: CGPoint(x: 1, y: 1)
  )
)

let c = Canvas(size: CGSize(width: 50, height: 50)) { c, s in

  let width: CGFloat = 2

  let outer = UIBezierPath(ovalIn: CGRect(origin: .zero, size: s))
  let inner = UIBezierPath(ovalIn: CGRect(x: width, y: width, width: s.width - (width * 2), height: s.height - (width * 2)))
  outer.append(inner)
  outer.usesEvenOddFillRule = true
  outer.addClip()

  drawer.draw(in: c, rect: CGRect(origin: .zero, size: s))

}

c.isOpaque = false
c.backgroundColor = .white
c.setNeedsDisplay()

let view = UIView(frame: c.bounds)
view.addSubview(c)
PlaygroundPage.current.liveView = view

//: [Next](@next)
