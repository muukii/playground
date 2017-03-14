//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let base = UIView()
PlaygroundPage.current.liveView = base

let v1 = UIView()
let v2 = UIView()

v1.translatesAutoresizingMaskIntoConstraints = false
v2.translatesAutoresizingMaskIntoConstraints = false

NSLayoutConstraint.activate([
  v1.topAnchor.constraint(equalTo: base.topAnchor),
  v1.rightAnchor.constraint(equalTo: base.rightAnchor),
  ])

base.addSubview(v1)
base.addSubview(v2)

v2.constraintsAffectingLayout(for: .vertical)

NSLayoutConstraint.activate([
  v2.topAnchor.constraint(equalTo: v1.topAnchor)
  ])

v2.constraintsAffectingLayout(for: .vertical)

//: [Next](@next)
