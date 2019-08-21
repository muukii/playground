//
//  8.swift
//  BinarySize
//
//  Created by muukii on 2019/08/15.
//  Copyright © 2019 muukii. All rights reserved.
//

import UIKit

final class LabelNode: UIView {
  
  let textNode = UILabel()
  
  init(text: String) {
    super.init(frame: .zero)
    
    addSubview(textNode)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
