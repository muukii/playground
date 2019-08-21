//
//  ViewController.swift
//  RenderVector
//
//  Created by muukii on 2019/08/05.
//  Copyright © 2019 eure. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var smallImageView: UIImageView!
  @IBOutlet weak var mediumImageView: UIImageView!
  @IBOutlet weak var largeImageView: UIImageView!
 
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let image = UIImage(named: "like")!  
    let data = PDFImage(named: "like")!
    
    if true {
      smallImageView.image = data.tinted(color: .black, size: .init(width: 30, height: 30))
      mediumImageView.image = data.tinted(color: .black, size: .init(width: 60, height: 60))
      largeImageView.image = data.tinted(color: .black, size: .init(width: 90, height: 90))
    } else {
      smallImageView.image = image.tinted(color: .black, size: .init(width: 30, height: 30))
      mediumImageView.image = image.tinted(color: .black, size: .init(width: 60, height: 60))
      largeImageView.image = image.tinted(color: .black, size: .init(width: 90, height: 90))
    }
    
    // Do any additional setup after loading the view.
  }

  func render(image: UIImage, size: CGSize, color: UIColor) -> UIImage {
    
    let templateImage = image
    
    let renderer = UIGraphicsImageRenderer(size: size, format: .default())
    
    return renderer
      .image { (context) in
        color.setFill()
        templateImage.draw(in: CGRect(origin: .zero, size: size), blendMode: .copy, alpha: 1)
      }
      .withRenderingMode(.alwaysOriginal)
    
  }
  


}

