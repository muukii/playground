import UIKit

import PlaygroundSupport

class ViewController : UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    print("ViewDidLoad")

    DispatchQueue.main.async {
      print(navigationController)
    }
  }

  override func willMove(toParent parent: UIViewController?) {
    super.willMove(toParent: parent)
    print(parent)
    if let nav = parent as? UINavigationController {
      nav.hidesBarsOnSwipe = true
    }
  }
}

let nav = UINavigationController()

let vc = ViewController()

nav.pushViewController(vc, animated: false)

vc.view.alpha = 0

PlaygroundPage.current.liveView = nav

print("End")
