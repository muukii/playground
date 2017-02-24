//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport

let drawer = LinearGradientDrawer(
  descriptor: .init(
    locationAndColors: [
      (0, UIColor.red),
      (1, UIColor.green),
      ],
    startPoint: CGPoint(x: 0, y: 0),
    endPoint: CGPoint(x: 1, y: 1)
  )
)

let c = Canvas(size: CGSize(width: 50, height: 50)) { c, s in

  if let layer = CGLayer(c, size: s, auxiliaryInfo: nil),
    let layerContext = layer.context {

    let width: CGFloat = 2

    let outer = UIBezierPath(ovalIn: CGRect(origin: .zero, size: s))
    let inner = UIBezierPath(ovalIn: CGRect(x: width, y: width, width: s.width - (width * 2), height: s.height - (width * 2)))
    outer.append(inner)
    outer.usesEvenOddFillRule = true
    outer.addClip()

    drawer.draw(in: layerContext, rect: CGRect(origin: .zero, size: s))

    c.draw(layer, at: .zero)
  }

  if let layer = CGLayer(c, size: s, auxiliaryInfo: nil),
    let layerContext = layer.context {

    UIGraphicsPushContext(layerContext)

    let fillColor = UIColor.white

    let rectPath = UIBezierPath(rect: CGRect(origin: .zero, size: s))
    fillColor.setFill()
    rectPath.fill()

    let circlePath = UIBezierPath(roundedRect: CGRect(origin: .zero, size: s), cornerRadius: 30)
    layerContext.setBlendMode(.clear)
    UIColor.clear.setFill()
    circlePath.fill()
    UIGraphicsPopContext()

    c.draw(layer, at: .zero)
  }
}

c.isOpaque = false
c.backgroundColor = .white
c.setNeedsDisplay()

let view = UIView(frame: c.bounds)
view.addSubview(c)
PlaygroundPage.current.liveView = view

//: [Next](@next)
