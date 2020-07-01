import Cocoa

struct MyValue {}

func pointer<T>(of value: T) -> UnsafePointer<T> {
  withUnsafePointer(to: value) { (p) -> UnsafePointer<T> in
    return p
  }
}

let v = MyValue()

withUnsafePointer(to: v) { (p) -> Void in
  print(p)
}

withUnsafePointer(to: v) { (p) -> Void in
  print(p)
}

pointer(of: v)
pointer(of: v)

func run(value: MyValue) {
  pointer(of: value)
}

run(value: v)

