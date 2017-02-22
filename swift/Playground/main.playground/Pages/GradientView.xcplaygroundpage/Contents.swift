//: [Previous](@previous)

import UIKit

import PlaygroundSupport

open class GradientView: UIView {

  private let gradientLayer = CAGradientLayer()

  public override init(frame: CGRect) {
    super.init(frame: frame)
    layer.addSublayer(gradientLayer)
  }

  @available(*, unavailable)
  public required init?(coder aDecoder: NSCoder) {
    fatalError()
  }

  open override func layoutSubviews() {
    super.layoutSubviews()
    gradientLayer.frame = bounds
  }

  open func set(descriptor: LinearGradientDescriptor) {
    descriptor.apply(to: gradientLayer)
  }

  public struct LinearGradientDescriptor {

    // MARK: - Properties

    public let colors: [UIColor]
    public let locations: [CGFloat]
    public let startPoint: CGPoint
    public let endPoint: CGPoint

    // MARK: - Initializers

    public init(locationAndColors: [(CGFloat, UIColor)], startPoint: CGPoint, endPoint: CGPoint) {

      self.colors = locationAndColors.map { $0.1 }
      self.locations = locationAndColors.map { $0.0 }
      self.startPoint = startPoint
      self.endPoint = endPoint
    }

    public func apply(to layer: CAGradientLayer) {

      layer.colors = colors.map { $0.cgColor }
      layer.locations = locations
        .map(Double.init)
        .map(NSNumber.init(value:))

      layer.startPoint = startPoint
      layer.endPoint = endPoint
    }
  }
}

let v = GradientView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))

v.set(
  descriptor: .init(
    locationAndColors: [
      (0, UIColor.red),
      (1, UIColor.blue),
    ],
    startPoint: CGPoint(x: 0, y: 0),
    endPoint: CGPoint(x: 1, y:1)
  )
)

PlaygroundPage.current.liveView = v

//: [Next](@next)
