//
//  ViewController.swift
//  Sketch
//
//  Created by muukii on 2019/04/17.
//  Copyright © 2019 muukii. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit

class ViewController: NSViewController {
  
  @IBOutlet var skView: SKView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let scene = MyScene(size: view.bounds.size)
    scene.scaleMode = .aspectFill
    skView.presentScene(scene)

    skView.ignoresSiblingOrder = true
    skView.showsFPS = true
    skView.showsNodeCount = true
    
  }
}

