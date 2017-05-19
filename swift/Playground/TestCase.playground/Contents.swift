//: Playground - noun: a place where people can play

import Foundation

class Group {
  
  struct Case {
    let action: String
    let result: String
    
    init(action: String, result: String) {
      self.action = action
      self.result = result
    }
  }
  
  struct Context: CustomStringConvertible {
    
    var s: [String] = []
    var c: Case?
    
    let group: Group
    
    init(_ v: String, group: Group) {
      s.append(v)
      self.group = group
    }
    
    func context(_ name: String, _ c: (Context) -> Void) {
      var a = self
      a.s.append(name)
      c(a)
    }
    
    func test(action: () -> String, result: () -> String) {
      let _c = Case(action: action(), result: result())
      var _a = self
      _a.c = _c
      group.buf.append(_a)
    }
    
    var empty: Void {
      return ()
    }
    
    var description: String {
      return "📦Case : \(s.joined(separator: " => ")) 🚨Action: \(c?.action ?? ""), \(c?.result ?? "")"
    }
  }
  
  let title: String
  
  var buf: [Context] = []
  
  init(title: String, _ define: (Group) -> Void) {
    
    self.title = title
    
    define(self)
  }
  
  func context(_ name: String, _ c: (Context) -> Void) {
    let context = Context(name, group: self)
    c(context)
  }
  
}


let c = Group(title: "example") {
  
  $0.context("Male") {
    
    $0.context("Free") {
      
      $0.context("AgeVerification no") {
        $0.test(action: { "oh" }, result: { "yeah" })
      }
      
      $0.context("AgeVerification yes") {
        $0.test(action: { "oh" }, result: { "yeah" })
        $0.test(action: { "oh" }, result: { "yeah" })
      }
      
    }
    
    $0.context("Paid") {
      $0.context("AgeVerification no") {
        $0.test(action: { "oh" }, result: { "yeah" })
      }
      
      $0.context("AgeVerification yes") {
        $0.test(action: { "oh" }, result: { "yeah" })

      }
    }
    
    $0.context("Premium") {
      $0.context("AgeVerification no") {
        $0.test(action: { "oh" }, result: { "yeah" })
      }
      
      $0.context("AgeVerification yes") {
        $0.test(action: { "oh" }, result: { "yeah" })
      }
    }
    
    $0.context("Paid & Premium") {
      $0.context("AgeVerification no") {
        $0.test(action: { "oh" }, result: { "yeah" })
      }
      
      $0.context("AgeVerification yes") {
        $0.test(action: { "oh" }, result: { "yeah" })
      }
    }
  }
  
  $0.context("Female") {
    $0.empty
  }
}

c.buf.forEach {
  print($0)
}

//print(c.a)
