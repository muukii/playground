//: [Previous](@previous)

import Foundation
import ObjectiveC

enum Case {
  case a, b, c
}

extension NSObject {
  
  var __string: String {
    get {
      return objc_getAssociatedObject(self, &Pointer.__string) as! String
    }
    set {
      objc_setAssociatedObject(self, &Pointer.__string, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
  }
  
  var __case: [Case] {
    get {
      return objc_getAssociatedObject(self, &Pointer.__string) as! [Case]
    }
    set {
      objc_setAssociatedObject(self, &Pointer.__string, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
  }
  
  private enum Pointer {
    static var __string: Void?
    static var __case: Void?
  }
}

let o = NSObject()

o.__string = "abc"
o.__string

o.__case = [.a, .a]
o.__case

//: [Next](@next)
