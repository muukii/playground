
#if os(iOS)

  import UIKit

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

  extension CAGradientLayer {

    public func apply(descriptor: LinearGradientDescriptor) {
      descriptor.apply(to: self)
    }
  }
#endif
