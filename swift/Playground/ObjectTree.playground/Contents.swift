import UIKit

struct IdentifiedObject: Hashable {
  let identifier: ObjectIdentifier
  
  init(_ object: AnyObject) {
    self.identifier = ObjectIdentifier(object)
  }
}

class ObjectTree {
  var references: Set<IdentifiedObject> = .init()
}
