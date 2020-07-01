final class AnyBox {
  
  var base: Any
  
  init(_ base: Any) {
    self.base = base
  }
}

struct AnyEntity {
  
  var base: Any {
    get {
      box.base
    }
    set {
      if isKnownUniquelyReferenced(&box) {
        box.base = newValue
      } else {
        box = .init(newValue)
      }
    }
  }
  
  private var box: AnyBox
  
  init(_ base: Any) {
    self.box = .init(base)
  }
  
}

let a = AnyEntity("Hello")

MemoryLayout.size(ofValue: a)

a.base
var b = a
b.base = "Hiroshi"
a.base

MemoryLayout.size(ofValue: AnyHashable("Hello"))
