//: [Previous](@previous)

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    print("viewDidLoad")
  }

  override func viewWillAppear(_ animated: Bool) {
    print("viewWillAppear")
  }

  override func viewDidAppear(_ animated: Bool) {
    print("viewDidAppear")
  }

  override func viewWillDisappear(_ animated: Bool) {
    print("viewWillDisapper")
  }

  override func viewDidDisappear(_ animated: Bool) {
    print("viewDidDisappear")
  }
}

let vc = ViewController()

vc.view

vc.beginAppearanceTransition(true, animated: true)
vc.endAppearanceTransition()

vc.beginAppearanceTransition(false, animated: true)

//: [Next](@next)
