//
//  BackportedPDFLoading.swift
//  RenderVector
//
//  Created by muukii on 2019/08/05.
//  Copyright © 2019 eure. All rights reserved.
//

import UIKit

public struct PDFImage {
  
  public enum VectorData: Swift.Error {
    case invalidURL
  }
  
  public let page: CGPDFPage
  public let document: CGPDFDocument
  
  public init(from url: URL) throws {
    
    guard
      let document = CGPDFDocument(url as CFURL),
      let page = document.page(at: 1) else {
        throw VectorData.invalidURL
    }
    
    self.document = document
    self.page = page
  }
  
  public init?(named: String, on bundle: Bundle = .main) {
    guard let url = bundle.url(forResource: named, withExtension: "pdf") else {
      return nil
    }
    try? self.init(from: url)
  }
}

extension PDFImage {
  
  public func tinted(color: UIColor, size: CGSize? = nil) -> UIImage? {
    
    let mediaSize = page.getBoxRect(.mediaBox).size
    let targetSize = size ?? mediaSize
    
    let renderer = UIGraphicsImageRenderer(size: targetSize)
    
    let ratio = targetSize.height / mediaSize.height
    
    let img = renderer.image { ctx in
      
      ctx.cgContext.translateBy(x: 0.0, y: mediaSize.height * ratio)
      ctx.cgContext.scaleBy(x: 1.0 * ratio, y: -1.0 * ratio)
      ctx.cgContext.drawPDFPage(page)
      }
      .withRenderingMode(.alwaysTemplate)
    
    return
      UIGraphicsImageRenderer(size: targetSize)
        .image { (context) in
          color.setFill()
          img.draw(in: CGRect(origin: .zero, size: targetSize), blendMode: .copy, alpha: 1)
    }
    
  }
  
}
