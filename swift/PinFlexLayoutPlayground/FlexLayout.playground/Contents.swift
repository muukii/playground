//: Playground - noun: a place where people can play

import UIKit

import FlexLayout
import PlaygroundSupport

let c = UIView()

c
  .flex
//  .size(10)
  .define { flex in

    flex
      .addItem()
      .backgroundColor(.gray)
      .size(30)
}

c.flex.intrinsicSize
c.frame
c.flex.layout(mode: .adjustWidth)
c.frame
c.flex.sizeThatFits(size: .zero)

