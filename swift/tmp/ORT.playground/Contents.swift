








protocol Foo {
  
}

struct Body : Foo {
  
}

@available(OSX 10.15.0, *)
enum Wrap {
  func run() -> some Foo {
    return Body()
  }
  
  class Service {
    
    var foo: some Foo {
       return Body()
    }
    
    var f: some Foo?
  }
}
