import UIKit

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class ViewController : UIViewController {

  let box = UIView()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white

    box.backgroundColor = UIColor.init(white: 0, alpha: 0.8)
    box.frame = .init(x: 120, y: 20, width: 30, height: 30)

    view.addSubview(box)

  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    let attachmentBehavior = UIAttachmentBehavior(item: box, attachedToAnchor: .init(x: 220, y: 400))

    attachmentBehavior.frequency = 1
    attachmentBehavior.damping = 0.2
    attachmentBehavior.length = 10

    let itemBehavior = UIDynamicItemBehavior(items: [box])

    itemBehavior.density = 10
    itemBehavior.resistance = 20
    itemBehavior.angularResistance = 10

    itemBehavior.addAngularVelocity(300, for: box)

    let transaction = DynamicAnimateTransaction.init(referenceView: self.view)

    transaction.addBehavior([
      itemBehavior,
      attachmentBehavior
      ])

    transaction.addCompletion {
      print("Complete")
    }

    transaction.startAnimation()

//    box.center.x += 200
  }
}

PlaygroundPage.current.liveView = ViewController()
