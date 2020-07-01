import UIKit

public struct FlexRoudedCornerPathDescriptor {
  
  public var bottomLeft: CGFloat
  public var bottomRight: CGFloat
  public var topRight: CGFloat
  public var topLeft: CGFloat
  
  public init(
    topLeft: CGFloat,
    topRight: CGFloat,
    bottomRight: CGFloat,
    bottomLeft: CGFloat
  ) {
    
    self.bottomLeft = bottomLeft
    self.bottomRight = bottomRight
    self.topRight = topRight
    self.topLeft = topLeft
    
  }
  
  public func makePath(in rect: CGRect) -> UIBezierPath {
    
    func radian(_ angle: CGFloat) -> CGFloat {
      return angle * CGFloat.pi / 180
    }
    
    func clamp(_ value: CGFloat) -> CGFloat {
      min(min(rect.height / 2, value), rect.width / 2)
    }
    
    let _topLeft = clamp(self.bottomLeft)
    let _topRight = clamp(self.bottomRight)
    let _bottomRight = clamp(self.topRight)
    let _bottomLeft = clamp(self.topLeft)
        
    let path = UIBezierPath()
    path.move(to: CGPoint(x: _topLeft, y: 0))
    
    path.addLine(to: CGPoint(x: rect.maxX - _topRight, y: 0))
    path.addArc(withCenter: CGPoint(x: rect.maxX - _topRight, y: _topRight), radius: _topRight, startAngle: radian(-90), endAngle: radian(0), clockwise: true)
    
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - _bottomRight))
    path.addArc(withCenter: CGPoint(x: rect.maxX - _bottomRight, y: rect.maxY - _bottomRight), radius: _bottomRight, startAngle: radian(0), endAngle: radian(90), clockwise: true)
    
    path.addLine(to: CGPoint(x: _bottomLeft, y: rect.maxY))
    path.addArc(withCenter: CGPoint(x: _bottomLeft, y: rect.maxY - _bottomLeft), radius: _bottomLeft, startAngle: radian(90), endAngle: radian(180), clockwise: true)
    
    path.addLine(to: CGPoint(x: 0, y: _topLeft))
    path.addArc(withCenter: CGPoint(x: _topLeft, y: _topLeft), radius: _topLeft, startAngle: radian(180), endAngle: radian(270), clockwise: true)
    
    return path
    
  }
  
}


let rect = CGRect(x: 0, y: 0, width: 200, height: 80)

let round = UIBezierPath(roundedRect: rect, cornerRadius: .infinity)

UIBezierPath(roundedRect: rect, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: CGFloat.infinity, height: 0))

let smooth = UIBezierPath(roundedRect: rect, cornerRadius: 16)

FlexRoudedCornerPathDescriptor(topLeft: 100, topRight: 100, bottomRight: 100, bottomLeft: 16).makePath(in: rect)
