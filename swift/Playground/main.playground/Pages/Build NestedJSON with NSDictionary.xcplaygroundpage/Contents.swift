//: [Previous](@previous)

import Foundation

let root = NSMutableDictionary()

func append(key: String, dic: [String : String]) {
  let tokens = key.components(separatedBy: ".")

  var _root = root

  for key in tokens {

    if _root[key] == nil {
      _root[key] = NSMutableDictionary()
    }

    _root = _root[key] as! NSMutableDictionary
  }

  _root["l10n"] = dic
}

append(key: "a.b.c.cd", dic: ["Base" : "hello"])
append(key: "a.c.cd", dic: ["Base" : "hello"])
append(key: "a.c.dd", dic: ["Base" : "hello"])
append(key: "b.c.dd", dic: ["Base" : "hello", "zh-Hant" : "行"])

let data = try JSONSerialization.data(withJSONObject: root, options: [])
print(String(data: data, encoding: .utf8)!)

//print(buffer)
print(root)


//: [Next](@next)
