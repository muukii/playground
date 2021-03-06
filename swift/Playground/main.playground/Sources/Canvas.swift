
#if os(iOS)
  import UIKit

  public class Canvas: UIView {

    public let drawFunction: (CGContext, CGSize) -> Void

    public init(size: CGSize, draw: @escaping (CGContext, CGSize) -> Void) {
      drawFunction = draw
      super.init(frame: CGRect(origin: .zero, size: size))
    }

    public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    public override func draw(_ rect: CGRect) {
      drawFunction(UIGraphicsGetCurrentContext()!, bounds.size)
    }
  }
#endif
