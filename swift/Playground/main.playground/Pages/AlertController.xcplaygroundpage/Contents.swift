//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let vc = UIViewController()

vc.view.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
vc.view.backgroundColor = .red

PlaygroundPage.current.liveView = vc
PlaygroundPage.current.needsIndefiniteExecution = true

do {
  print("present alert")
  let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)

  alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { _ in
  }))

  alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { _ in
  }))

  vc.present(alert, animated: true, completion: nil)
  PlaygroundPage.current.liveView = alert
}

print(vc.childViewControllers)
//: [Next](@next)
