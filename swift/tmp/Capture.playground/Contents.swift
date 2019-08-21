import Cocoa

class Ref {
  deinit {
    print("deinit")
  }
}

class Foo {
  
  var closure: () -> Void = {}
  
  var ref: Ref = .init()
  
  func run() {
    
    closure = { [weak ref = self.ref] in
      print(ref)
    }
  }
  
  deinit {
    print("deinit")
  }
}

var foo: Foo? = .init()

foo?.run()

foo = nil
