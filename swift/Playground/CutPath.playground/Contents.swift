import UIKit

let rect = CGRect(x: 0, y: 0, width: 200, height: 60)

let frame = UIBezierPath(rect: rect)

let path = UIBezierPath(roundedRect: rect, cornerRadius: 16)

frame.usesEvenOddFillRule = true

frame.append(path)




