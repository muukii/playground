//
//  ViewController.swift
//  iOS13-Text
//
//  Created by muukii on 2019/09/02.
//  Copyright © 2019 muukii. All rights reserved.
//

import UIKit

import AsyncDisplayKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let node = ASTextNode2()
    
    let paragraph = NSMutableParagraphStyle()
    
    paragraph.lineBreakMode = .byCharWrapping
        
    node.attributedText = NSAttributedString(
      string: "こんにちは",
      attributes: [
        NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18),
        NSAttributedString.Key.foregroundColor : UIColor.init(white: 0.8, alpha: 1),
        NSAttributedString.Key.paragraphStyle : paragraph,
      ]
    )
    
    let layout = node.layoutThatFits(ASSizeRangeUnconstrained)
    
    view.addSubview(node.view)
    
    node.view.frame.size = layout.size
    node.view.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
    
  }


}

