//: Playground - noun: a place where people can play

import UIKit

import PlaygroundSupport

do {
  let c = Canvas(size: CGSize(width: 8, height: 8)) { c, s in

    assert(s.width == s.height)

    let width = s.width
    let inset = width * 0.1875
    let innerInset = width * 0.375

    let rect = CGRect(origin: .zero, size: s)
    let outsideCircleColor = UIColor.white
    let insideCircleColor = UIColor.red

    let outsideCircle = UIBezierPath(ovalIn: rect)
    outsideCircleColor.setFill()
    outsideCircle.fill()

    let insideCircle = UIBezierPath(ovalIn: rect.insetBy(dx: inset, dy: inset))
    let inner = UIBezierPath(ovalIn: rect.insetBy(dx: innerInset, dy: innerInset))
    insideCircle.append(inner)
    insideCircle.usesEvenOddFillRule = true
    insideCircleColor.setFill()
    insideCircle.fill()
  }

  c.isOpaque = false
  c.backgroundColor = .clear
  c.setNeedsDisplay()
}

do {
  let c = Canvas(size: CGSize(width: 32, height: 32)) { c, s in

    assert(s.width == s.height)

    let width = s.width
    let inset = width * 0.1875
    let innerInset = width * 0.375

    let rect = CGRect(origin: .zero, size: s)
    let outsideCircleColor = UIColor.white
    let insideCircleColor = UIColor.red

    let outsideCircle = UIBezierPath(ovalIn: rect)
    outsideCircleColor.setFill()
    outsideCircle.fill()

    let insideCircle = UIBezierPath(ovalIn: rect.insetBy(dx: inset, dy: inset))
    let inner = UIBezierPath(ovalIn: rect.insetBy(dx: innerInset, dy: innerInset))
    insideCircle.append(inner)
    insideCircle.usesEvenOddFillRule = true
    insideCircleColor.setFill()
    insideCircle.fill()
  }

  c.isOpaque = false
  c.backgroundColor = .clear
  c.setNeedsDisplay()
}

