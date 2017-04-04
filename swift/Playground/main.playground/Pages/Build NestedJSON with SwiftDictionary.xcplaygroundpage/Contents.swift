//: [Previous](@previous)

import Foundation

class ReferenceDictionary<Key: Hashable, Value>: CustomStringConvertible {

  var source: [Key : Value]

  init(source: [Key : Value] = [:]) {
    self.source = source
  }

  subscript (key: Key) -> Value? {
    get {
      return source[key]
    }
    set {
      guard let newValue = newValue else {
        source.removeValue(forKey: key)
        return
      }
      source[key] = newValue
    }
  }

  var description: String {
    return source.description
  }

  var jsonString: String {
    return description
      .replacingOccurrences(of: "[", with: "{")
      .replacingOccurrences(of: "]", with: "}")
      .replacingOccurrences(of: " ", with: "")
  }
}

typealias Node = ReferenceDictionary<String, Any>
var root = Node()

func append(key: String, dic: [String : String]) {
  let tokens = key.components(separatedBy: ".")

  var _root = root

  for key in tokens {

    if _root[key] == nil {
      _root[key] = Node()
    }
    _root = _root[key]! as! Node
  }

  _root["l10n"] = dic
}

append(key: "a.b.c.cd", dic: ["Base" : "hello"])
append(key: "a.c.cd", dic: ["Base" : "hello"])
append(key: "a.c.dd", dic: ["Base" : "hello"])
append(key: "b.c.dd", dic: ["Base" : "hello", "zh-Hant" : "行"])

//print(root.source)

print(root.jsonString)
let _data = root.jsonString.data(using: .utf8)
let obj = try! JSONSerialization.jsonObject(with: _data!, options: [])
print(obj)
//print(String(data: data, encoding: .utf8)!)

//print(buffer)
//print(root)


//: [Next](@next)
