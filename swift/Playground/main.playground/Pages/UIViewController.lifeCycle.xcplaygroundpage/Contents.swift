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

let vc1 = ViewController()
let vc2 = ViewController()
vc1.view
vc2.view

vc1.beginAppearanceTransition(true, animated: true)
//vc1.endAppearanceTransition()
vc1.beginAppearanceTransition(true, animated: true)
vc1.endAppearanceTransition()
vc1.endAppearanceTransition()


//
//vc1.beginAppearanceTransition(false, animated: true)

//: [Next](@next)
