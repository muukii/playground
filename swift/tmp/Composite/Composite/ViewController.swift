//
//  ViewController.swift
//  Composite
//
//  Created by muukii on 10/9/18.
//  Copyright © 2018 muukii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var container: UIView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    container.layer.compositingFilter = "multiplyBlendMode"
  }


}

