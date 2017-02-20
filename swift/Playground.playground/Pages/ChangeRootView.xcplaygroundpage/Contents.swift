//: [Previous](@previous)

import UIKit

class MyView: UIView {

  var name: String = ""
}

class ViewController_A: UIViewController {

}

class ViewController_B: UIViewController {
  override func loadView() {
    self.view = MyView()
  }
}


let vc_a = ViewController_A()

let vc_b = ViewController_B()

String(describing: vc_a.view)
String(describing: vc_b.view)

//: [Next](@next)
