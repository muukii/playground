import UIKit

let view = UIView()
view.backgroundColor = .white

view.value(forKey: "backgroundColor")

class Model : NSObject {
  
  @objc var backgroundColorA: UIColor?
  @objc var backgroundColorB: UIColor?
  @objc var backgroundColorC: UIColor?
}

NSArray
