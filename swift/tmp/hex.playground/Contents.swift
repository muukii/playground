import UIKit

let hex: Int = 0xab22af

String.init((hex & 0xFF0000) >> 16, radix: 16, uppercase: true)
String.init((hex & 0x00FF00) >> 8, radix: 16, uppercase: true)
String.init(hex & 0x0000FF, radix: 16, uppercase: true)

extension UIColor {

  convenience init(hex: UInt) {
    self.init(
      red: CGFloat((hex & 0xFF0000) >> 0x10) / CGFloat(0xFF),
      green: CGFloat((hex & 0x00FF00) >> 0x8) / CGFloat(0xFF),
      blue: CGFloat((hex & 0x0000FF)) / CGFloat(0xFF),
      alpha: 1
    )
  }
}

UIColor.init(hex: 0xFFFFFF)
UIColor.init(hex: 0x677788)
