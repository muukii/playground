//
//  MyScene.swift
//  Sketch
//
//  Created by muukii on 2019/04/21.
//  Copyright © 2019 muukii. All rights reserved.
//

import SpriteKit

final class MyScene : SKScene {
  
  override func didMove(to view: SKView) {
    super.didMove(to: view)
    backgroundColor = .white
  }
  
  override func mouseDragged(with event: NSEvent) {
    super.touchesMoved(with: event)
    
    for _ in 0..<5 {
      
      let node = makeNode()
      
      var position = event.location(in: self)
      position.x += CGFloat((-100...100).randomElement()!)
      position.y += CGFloat((-100...100).randomElement()!)
      node.position = position
      
      addChild(node)
    }
  }
  
  private func makeNode() -> SKNode {
    
    return MyNode()
    
//    let node = SKShapeNode(circleOfRadius: 2)
//    node.lineWidth = 5
//    node.strokeColor = NSColor(red: 0.83, green: 1, blue: 0.1, alpha: 0.6)
////    node.blendMode = .add
//
//    node.run(
//      SKAction.sequence(
//        [
//          SKAction.wait(forDuration: 2),
//          SKAction.removeFromParent(),
//        ]
//      )
//    )
//
//    node.run(
//      SKAction.fadeOut(withDuration: 1.3)
//    )
//
//    node.run(
//      SKAction.scaleY(to: 10, duration: 2)
//    )
//    node.run(
//      SKAction.scaleX(to: 10, duration: 2)
//    )
    
//    return node
  }
  
  override func update(_ currentTime: TimeInterval) {
//    print(currentTime)
    // Called before each frame is rendered
  }
}

let shader = SKShader(fileNamed: "basic_vertex")

class MyNode : SKNode {
  
  override init() {
    super.init()
    
    let node = SKShapeNode(circleOfRadius: 2)
    node.lineWidth = 5
    node.strokeColor = NSColor(red: 0.83, green: 1, blue: 0.1, alpha: 0.6)
    //    node.blendMode = .add
    
    run(
      SKAction.sequence(
        [
          SKAction.wait(forDuration: 2),
          SKAction.removeFromParent(),
        ]
      )
    )
    
    node.run(
      SKAction.fadeOut(withDuration: 1.3)
    )
    
    node.run(
      SKAction.scaleY(to: 10, duration: 2)
    )
    node.run(
      SKAction.scaleX(to: 10, duration: 2)
    )
    
    addChild(node)
    
    node.strokeShader = shader
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

