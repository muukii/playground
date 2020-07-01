import Foundation

struct KeyTable {
  let a: String = "a"
  let b: String = "b"
}

@dynamicMemberLookup
struct Buffer {
  
  var storage: [AnyHashable : [Any]] = [:]
  var keyTable = KeyTable()

  subscript <U: Hashable>(dynamicMember keyPath: KeyPath<KeyTable, U>) -> [Any] {
    get {
    let key = keyTable[keyPath: keyPath]
    return storage[key] ?? []
    }
    set {
      let key = keyTable[keyPath: keyPath]
      storage[key] = newValue
    }
  }
}

var b = Buffer()
b.a = ["hoge"]
print(b.a)
