
class Box {
  
  var _a: () -> Void = {}
  var _b: () -> Void = {}
  
  func a() {
    
    _a = {
      self.b()
    }
    
    _a = {}
    
  }
  
  func b() {

    _b = { [weak self] in
      print(self)
    }
  }
  
  deinit {
    print("deinit", self)
  }
  
}

var box: Box? = Box()
box?.a()

box = nil
