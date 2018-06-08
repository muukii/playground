import UIKit

/*:
 # Image and Graphics Best Practices

 - ref: https://developer.apple.com/videos/play/wwdc2018/219
 */

func downsample(imageAt imageURL: URL, to pointSize: CGSize, scale: CGFloat) -> UIImage {
  let imageSourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
  let imageSource = CGImageSourceCreateWithURL(imageURL as CFURL, imageSourceOptions)!

  let maxDimensionInPixels = max(pointSize.width, pointSize.height) * scale
  let downsampleOptions =
    [kCGImageSourceCreateThumbnailFromImageAlways: true,
     kCGImageSourceShouldCacheImmediately: true,
     kCGImageSourceCreateThumbnailWithTransform: true,
     kCGImageSourceThumbnailMaxPixelSize: maxDimensionInPixels] as CFDictionary

  let downsampledImage =
    CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downsampleOptions)!
  return UIImage(cgImage: downsampledImage)
}

let path = Bundle
  .main
  .path(forResource: "image", ofType: "jpg")
  .map(URL.init(fileURLWithPath: ))!

let image = downsample(imageAt: path, to: CGSize(width: 300, height: 300), scale: 1)
