//: [Previous](@previous)

import Foundation

class Node {
  
  var name: String = ""
  
  func set(name: String) -> Self {
    self.name = name
    return self
  }
}

var nodes: [() -> Node] = []

func append(_ node: @escaping () -> Node) {
  
  nodes.append(node)
}

append { Node().set(name: "ab") }

//: [Next](@next)
