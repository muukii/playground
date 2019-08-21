import UIKit

import PlaygroundSupport

let canvas = UIView()
canvas.backgroundColor = .white
canvas.frame = .init(x: 0, y: 0, width: 32, height: 32)

class Indicator : UIView {
  
  private let placeholderShapeLayer = CAShapeLayer()
  private let tickShapeLayer = CAShapeLayer()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    
    do {
      layer.addSublayer(placeholderShapeLayer)
      
      placeholderShapeLayer.fillColor = UIColor.clear.cgColor
      placeholderShapeLayer.strokeColor = UIColor.init(white: 0, alpha: 0.2).cgColor
      placeholderShapeLayer.lineWidth = 3
    }
    
    do {
      tickShapeLayer
      
      layer.addSublayer(tickShapeLayer)
      
      tickShapeLayer.fillColor = UIColor.clear.cgColor
      tickShapeLayer.strokeColor = UIColor.init(white: 0, alpha: 0.3).cgColor
      tickShapeLayer.strokeStart = 0
      tickShapeLayer.strokeEnd = 0.2
      tickShapeLayer.lineCap = .round
      tickShapeLayer.lineWidth = 3
    }
  }
  
  override func didMoveToWindow() {
    super.didMoveToWindow()
    animate()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    
    do {
      placeholderShapeLayer.frame = self.layer.bounds
      tickShapeLayer.frame = self.layer.bounds
      let path = UIBezierPath(roundedRect: self.layer.bounds, cornerRadius: .infinity)
      placeholderShapeLayer.path = path.cgPath
      tickShapeLayer.path = path.cgPath
    }
  }
  
  private func animate() {
    
    tickShapeLayer.removeAnimation(forKey: "animation")
    
    let rotate = CABasicAnimation(keyPath: "transform.rotation.z")
    
    rotate.fromValue = 0
    rotate.toValue = CGFloat.pi * 2
    rotate.repeatCount = .infinity
    
    let group = CAAnimationGroup()
    group.animations = [
      rotate
    ]
    group.duration = 0.6
    group.repeatCount = .infinity
    
    tickShapeLayer.add(group, forKey: "animation")
    
  }
}

let indicator = Indicator(frame: .zero)

canvas.addSubview(indicator)

indicator.frame = canvas.bounds.insetBy(dx: 4, dy: 4)

PlaygroundPage.current.liveView = canvas
