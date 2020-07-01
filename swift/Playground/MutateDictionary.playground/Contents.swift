import Cocoa

struct Box {
  var id: String = ""
  var name: String = ""
  var number: Int = 0
}

do {
  var a: [Box] = [Box()]
  
  let _a = a as [Any]
  let __a = _a as! [Box]
}

do {
  var a: [String : Box] = ["a": Box()]
  
  let _a = a as [String : Any]
  let __a = _a as! [String : Box]
}

var buffer: [String : Any] = ["a": Box()]

MemoryLayout<Box>.size
MemoryLayout<Any>.size

buffer["a"]

withUnsafeMutablePointer(to: &buffer["a"]!) { (pointer) -> Void in
  var box = pointer.pointee as! Box
  box.name = "Hello"
  pointer.pointee = box
}

withUnsafePointer(to: &buffer["a"]!) { (p) -> Void in
  print(p)
}
withUnsafePointer(to: &buffer["a"]!) { (p) -> Void in
  print(p)
}
var value = buffer["a"]!
MemoryLayout.size(ofValue: value)
withUnsafePointer(to: &value) { (p) -> Void in
  print(p)
}
withUnsafePointer(to: &value) { (p) -> Void in
  print(p)
}
withUnsafeMutableBytes(of: &value) { (p) -> Void in
  p.startIndex
  p.endIndex
  p.baseAddress
  p.baseAddress?.advanced(by: p.endIndex)
}
var _value = value as! Box
MemoryLayout.size(ofValue: _value)
withUnsafePointer(to: &_value) { (p) -> Void in
  print(p)
}
withUnsafePointer(to: &_value) { (p) -> Void in
  print(p)
}
withUnsafeMutableBytes(of: &_value) { (p) -> Void in
  p.startIndex
  p.endIndex
  p.baseAddress
  p.baseAddress?.advanced(by: p.endIndex)
}
dump(buffer["a"])
