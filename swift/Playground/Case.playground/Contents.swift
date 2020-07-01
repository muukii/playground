import Cocoa

enum Kind {
  
  case _foo(String)
  case bar
    
  static var buzz: Kind {
    .bar
  }
  
  static func foo(_ v: String) -> Self {
    assert(v.isEmpty == false)
    return ._foo(v)
  }
}

func perform(_ value: Kind) {
  
}

perform(.bar)

perform(.buzz)
perform(.foo(""))



