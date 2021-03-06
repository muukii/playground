import UIKit

import AsyncDisplayKit
import PlaygroundSupport

class PlaygroundTextureViewController : UIViewController {

  override func viewDidLoad() {

    super.viewDidLoad()

    let node = RootNode()

    node.frame.origin.y = 100
    node.frame.size = .init(width: 300, height: 300)

    view.addSubnode(node)

  }
}

extension PlaygroundTextureViewController {

  class RootNode : ASDisplayNode {

    let boxes: [ASDisplayNode]

    override init() {

      boxes = (0..<5).map { _ in
        ASDisplayNode()
      }

      super.init()

      backgroundColor = UIColor.init(white: 0.95, alpha: 1)

      boxes
        .forEach {
          $0.backgroundColor = UIColor.init(white: 0.9, alpha: 1)
          $0.style.height = ASDimension.init(unit: .points, value: 30)
      }

      automaticallyManagesSubnodes = true

    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {


      return
        ASOverlayLayoutSpec(
          child: ASStackLayoutSpec(
            direction: .vertical,
            spacing: 4,
            justifyContent: .spaceBetween,
            alignItems: .stretch,
            children: boxes
          ),
          overlay: {
            let node = ASTextNode()
            node.attributedText = NSAttributedString.init(string: (0..<100).map { String($0) }.joined())
            node.style.flexGrow = 0
            return node
          }()
      )
    }
  }
}


PlaygroundPage.current.liveView = PlaygroundTextureViewController()
