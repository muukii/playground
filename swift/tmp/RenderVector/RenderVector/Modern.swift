//
//  Modern.swift
//  RenderVector
//
//  Created by muukii on 2019/08/05.
//  Copyright © 2019 eure. All rights reserved.
//

import UIKit

extension UIImage {
  
  func tinted(color: UIColor, size: CGSize? = nil) -> UIImage {
    
    let templateImage = self
    let targetSize = size ?? templateImage.size
    
    let renderer = UIGraphicsImageRenderer(size: targetSize, format: .default())
    
    return renderer
      .image { (context) in
        color.setFill()
        templateImage.draw(in: CGRect(origin: .zero, size: targetSize), blendMode: .copy, alpha: 1)
      }
      .withRenderingMode(.alwaysOriginal)
    
  }
  
}
