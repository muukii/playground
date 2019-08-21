
import UIKit
import PlaygroundSupport

let view = UIStackView()
view.layer


final class NonRenderingView : UIView {
  
  override class var layerClass: AnyClass {
    return CATransformLayer.self
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
  }
}

final class RenderingView : UIView {
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
  }
}

let v = NonRenderingView()
v.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
v.backgroundColor = .red

PlaygroundPage.current.liveView = v
