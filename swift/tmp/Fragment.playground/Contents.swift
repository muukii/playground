import Foundation

protocol Foo {
  associatedtype Fragment
  var fragment: Fragment { get set }
}

protocol Fragment {
  var b: Int { get set }
}

struct StateA : Foo, Fragment {
  var a: Int = 0
  var b: Int = 0
  var c: Int = 0
  var d: Int = 0
  
  var fragment: Fragment {
    get {
      return self
    }
    set {
      
    }
  }
}

struct StateB : Foo , Fragment{
  var b: Int = 0
  var c: Int = 0
  
  var fragment: Fragment {
    get {
      return self
    }
    set {
      
    }
  }
}

let b = \Fragment.b

var stateA: Fragment = StateA()
var stateB: Fragment = StateB()

stateA[keyPath: b] = 3
stateB[keyPath: b] = 3

stateA.b
stateB.b



class Storage<T> {
  
  var _value: T
  
  init(_ value: T) {
    self._value = value
  }
  
  func update(_ update: (inout T) throws -> Void) rethrows {

  }
  
}

extension Storage where T : Fragment {
  
  func updateFragemnt(_ update: (inout Fragment) throws -> Void) rethrows {
    var f = _value as Fragment
    try update(&f)
    _value = f as! T
  }
}



let sA = Storage<StateA>(.init())
let sB = Storage<StateA>(.init())

sA.updateFragemnt { (f) in
  f.b = 5
}

sA._value
