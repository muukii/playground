
import Foundation

struct Outer {
  let name: Array<Int>
  let age: Int
}

struct Inner {

  let value: Int = 0
  let outer: Outer
}

let start = malloc(100)

var array = [1,2,3]
withUnsafeBytes(of: &array) { (pointer) -> Void in

  print(pointer)
  print(pointer.count)

  print(pointer.load(as: Int.self))

  pointer.startIndex
  print(pointer[0].load(as: Int.self))
  print(pointer[1].load(as: Int.self))
}




MemoryLayout<Float>.size

class Ref {
  let name: Int
  let height: String
  init() {
    self.name = 0
    self.height = "1290"
  }
}

MemoryLayout<Ref>.size

MemoryLayout<NSString>.size

MemoryLayout<NSString>.size

let r = Ref()

let a = CGRect()

let h = unsafeBitCast(r, to: NSString.self)

h.length

