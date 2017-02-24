
#if os(iOS)

  import UIKit

  public struct LinearGradientDrawer {

    // MARK: - Properties

    public let descriptor: LinearGradientDescriptor

    // MARK: - Initializers

    public init(descriptor: LinearGradientDescriptor) {

      self.descriptor = descriptor
    }

    // MARK: - Functions

    public func draw(in context: CGContext, rect: CGRect) {

      let colors = descriptor.colors
      let locations = descriptor.locations
      let startPoint = descriptor.startPoint
      let endPoint = descriptor.endPoint

      let cgGradient = CGGradient(
        colorsSpace: CGColorSpaceCreateDeviceRGB(),
        colors: colors.map { $0.cgColor } as CFArray, locations: locations)!

      let rectanglePath = UIBezierPath(rect: rect)
      context.saveGState()
      rectanglePath.addClip()
      context.drawLinearGradient(
        cgGradient,
        start: CGPoint(x: rect.width * startPoint.x, y: rect.maxY * startPoint.y),
        end: CGPoint(x: rect.width * endPoint.x, y: rect.maxY * endPoint.y),
        options: [.drawsAfterEndLocation, .drawsBeforeStartLocation]
      )
      context.restoreGState()
    }
  }
#endif
