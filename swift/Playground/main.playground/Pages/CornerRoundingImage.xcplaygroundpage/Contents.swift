//: [Previous](@previous)

import UIKit

private func createCircleMaskImage(fillColor: UIColor, size: CGSize, cornerRadius: CGFloat) -> UIImage {

  let scale = UIScreen.main.scale
  let size = CGSize(width: size.width * scale, height: size.height * scale)
  let cornerRadius = cornerRadius * scale

  UIGraphicsBeginImageContextWithOptions(size, false, 1)

  guard let context = UIGraphicsGetCurrentContext() else {
    UIGraphicsEndImageContext()
    return UIImage()
  }

  if let layer = CGLayer(context, size: size, auxiliaryInfo: nil),
    let layerContext = layer.context {

    UIGraphicsPushContext(layerContext)

    let rectPath = UIBezierPath(rect: CGRect(origin: .zero, size: size))
    fillColor.setFill()
    rectPath.fill()

    let circlePath = UIBezierPath(roundedRect: CGRect(origin: .zero, size: size), cornerRadius: cornerRadius)
    layerContext.setBlendMode(.clear)
    UIColor.clear.setFill()
    circlePath.fill()

    UIGraphicsPopContext()

    context.draw(layer, at: .zero)
  }

  let image = UIGraphicsGetImageFromCurrentImageContext()
    .flatMap { $0.cgImage }
    .map { UIImage(cgImage: $0, scale: scale, orientation: .up) }

  UIGraphicsEndImageContext()
  let _image = image ?? UIImage()

  let resizableImage = _image.resizableImage(withCapInsets: .init(
    top: cornerRadius,
    left: cornerRadius,
    bottom: cornerRadius,
    right: cornerRadius
    )
  )
  return resizableImage
}

let image = createCircleMaskImage(fillColor: .black, size: CGSize(width: 50, height: 50), cornerRadius: 8)

let imageView = UIImageView(image: image)
imageView.frame.size = CGSize(width: 300, height: 80)

imageView

//: [Next](@next)
