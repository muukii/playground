//: Playground - noun: a place where people can play

import UIKit

import PlaygroundSupport

let c = Canvas(size: CGSize(width: 300, height: 300)) { c in

}

c.backgroundColor = .white
c.setNeedsDisplay()

PlaygroundPage.current.liveView = c
