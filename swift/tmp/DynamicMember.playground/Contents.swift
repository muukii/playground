import Foundation

struct Point {
  var x, y: Int
}

@dynamicMemberLookup
struct Box<T> {
  var v: T
  
  init(_ v: T) {
    self.v = v
  }
  
  subscript<U>(dynamicMember member: KeyPath<T, U>) -> U {
    get { return v[keyPath: member] }
  }
}

var box = Box(Point(x: 0, y: 0))
_ = box.x
