import UIKit

public struct LinearGradientDescriptor {

  // MARK: - Properties

  let colors: [UIColor]
  let locations: [CGFloat]
  let startPoint: CGPoint
  let endPoint: CGPoint

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


fileprivate enum Cache {
  static let lock = NSLock()

  static var urls: [String : URL] {
    get {
      lock.lock(); defer { lock.unlock() }
      return _urls
    }
    set {
      lock.lock(); defer { lock.unlock() }
      _urls = newValue
    }
  }
  
  static var images: [URL : UIImage] {
    get {
      lock.lock(); defer { lock.unlock() }
      return _images
    }
    set {
      lock.lock(); defer { lock.unlock() }
      _images = newValue
    }
  }
  
  private static var _urls: [String : URL] = [:]
  private static var _images: [URL : UIImage] = [:]
}

public struct PDFImage {
  
  public enum VectorData: Swift.Error {
    case invalidURL
  }
  
  public let page: CGPDFPage
  public let document: CGPDFDocument
  private let url: URL
  
  public init(from url: URL) throws {
    
    guard
      let document = CGPDFDocument(url as CFURL),
      let page = document.page(at: 1) else {
        throw VectorData.invalidURL
    }
    
    self.url = url
    self.document = document
    self.page = page
  }
  
  public init?(named: String, on bundle: Bundle = .main) {
    if let url = Cache.urls[named] {
      try? self.init(from: url)
    } else {
      
      guard let url = bundle.url(forResource: named, withExtension: "pdf") else {
        return nil
      }
      
      Cache.urls[named] = url
      
      try? self.init(from: url)
    }
  }
}

extension PDFImage {
  
  func _makeTemplate(size: CGSize? = nil) -> UIImage {
    let mediaSize = page.getBoxRect(.mediaBox).size
    let targetSize = size ?? mediaSize
    
    let renderer = UIGraphicsImageRenderer(size: targetSize)
    
    let ratio = targetSize.height / mediaSize.height
    
    let image = renderer.image { ctx in
      
      ctx.cgContext.scaleBy(x: ratio, y: ratio)
      ctx.cgContext.drawPDFPage(page)
      }
      .withRenderingMode(.alwaysTemplate)
    
    return image
  }
  
  func _tinted(by color: UIColor, size: CGSize? = nil) -> UIImage {
    
    let templateImage = _makeTemplate(size: size)
    
    let image = UIGraphicsImageRenderer(size: templateImage.size)
        .image { (context) in
          color.setFill()
          context.cgContext.translateBy(x: 0.0, y: templateImage.size.height)
          context.cgContext.scaleBy(x: 1.0, y: -1.0)
          templateImage.draw(in: CGRect(origin: .zero, size: templateImage.size), blendMode: .copy, alpha: 1)
    }
    
    return image
  }
  
  func _filled(gradient: LinearGradientDescriptor, size: CGSize? = nil) -> UIImage {
    
    let templateImage = _makeTemplate(size: size)
    
    let image = UIGraphicsImageRenderer(size: templateImage.size)
      .image { (context) in
        context.cgContext.clip(to: .init(origin: .zero, size: templateImage.size), mask: templateImage.cgImage!)
        LinearGradientDrawer(descriptor: gradient).draw(in: context.cgContext, rect: .init(origin: .zero, size: templateImage.size))
    }
    
    return image
    
  }
  
  public func tinted(_ color: UIColor, size: CGSize? = nil) -> UIImage {
    
    if let renderedImage = Cache.images[url] {
      
      return renderedImage
    }
    
    let mediaSize = page.getBoxRect(.mediaBox).size
    let targetSize = size ?? mediaSize
    
    let renderer = UIGraphicsImageRenderer(size: targetSize)
    
    let ratio = targetSize.height / mediaSize.height
    
    let img = renderer.image { ctx in
      
      ctx.cgContext.scaleBy(x: 1.0 * ratio, y: -1.0 * ratio)
      ctx.cgContext.drawPDFPage(page)
      }
      .withRenderingMode(.alwaysTemplate)
    
    let image = UIGraphicsImageRenderer(size: targetSize)
        .image { (context) in
          color.setFill()
          img.draw(in: CGRect(origin: .zero, size: targetSize), blendMode: .copy, alpha: 1)
    }
    
    Cache.images[url] = image
    
    return image
    
  }
  
  
}

let icon = PDFImage(named: "icon")!

icon._tinted(by: .orange, size: .init(width: 50, height: 50))
icon._filled(gradient: .init(locationAndColors: [(0, .cyan), (1, .orange)], startPoint: .init(x: 0, y: 0), endPoint: .init(x: 1, y: 1)), size: .init(width: 50, height: 50))

icon._filled(gradient: .init(locationAndColors: [(0, .cyan), (1, .orange)], startPoint: .init(x: 0, y: 0), endPoint: .init(x: 1, y: 1)), size: .init(width: 300, height: 300))
