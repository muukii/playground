
for i in 0..<1000 {
  
  print("""

final class LabelNode_\(i): UIView {
  
  let textNode = UILabel()
  
  init(text: String) {
    super.init(frame: .zero)
    
    addSubview(textNode)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
""")
  
}
