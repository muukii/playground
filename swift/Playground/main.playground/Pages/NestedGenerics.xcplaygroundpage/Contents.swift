//: [Previous](@previous)

import Foundation

class Parent<V> {

  class Inner<D> {

    func run<T: Collection>(_ c: (T) -> Void) where T.Iterator.Element == V {

    }
  }
}

extension Parent.Inner where D: Hashable {

}

class __Outer {
  
  class __Inner<T> {
    
    var p: T? {
      return nil
    }
  }
}

func _foo(o: __Outer.__Inner) {
  print(o.p!)
}

func foo<T>(o: __Outer.__Inner<T>) {
  print(o.p)
}

//_foo(o: __Outer.__Inner<Int>())

//: [Next](@next)
