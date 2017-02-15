//: Playground - noun: a place where people can play

import UIKit

import PlaygroundSupport

let c = Canvas(size: CGSize(width: 16, height: 16)) { c, s in

  let rect = CGRect(origin: .zero, size: s)
  let outsideCircleColor = UIColor.white
  let insideCircleColor = UIColor.red

  let outsideCircle = UIBezierPath(ovalIn: rect)
  outsideCircleColor.setFill()
  outsideCircle.fill()

  let insideCircle = UIBezierPath(ovalIn: rect.insetBy(dx: 3, dy: 3))
  insideCircleColor.setFill()
  insideCircle.fill()
}

c.isOpaque = false
c.backgroundColor = .clear
c.setNeedsDisplay()

PlaygroundPage.current.liveView = c
