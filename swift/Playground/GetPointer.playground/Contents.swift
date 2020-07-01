import Foundation

struct Box {
  var name: String
  var computed: String {
    get {
      name
    }
    set {
      
    }
  }
}

func _getPointer<T>(_ pointer: UnsafeMutablePointer<T>) -> UnsafeMutablePointer<T> {
  pointer
}

var box = Box(name: "Hello")

do {
  let p = _getPointer(&box.name)
  p.pointee
  p.pointee = "Muuk"
  p.pointee
}

let p = _getPointer(&box.computed)
