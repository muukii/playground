import Foundation

struct Object: CustomReflectable {
  
  let name: String = "abc"
  
  var customMirror: Mirror {
    Mirror(self, children: [
      "name": name
    ], displayStyle: .struct)
  }
}

struct BasicObject {
  
  let name: String = "abc"

}

class RefObject: CustomReflectable {
  let name: String = "hello"
  
  
  var customMirror: Mirror {
    Mirror(self, children: [
      "name": name
    ], displayStyle: .enum)
  }
}

class Foo {
  var number = 0
}

print(BasicObject())
print(String(reflecting: Object()))
print(RefObject())

print(Mirror(reflecting: Foo()).children)

dump(Foo())
