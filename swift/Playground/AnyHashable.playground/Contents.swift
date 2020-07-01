import Foundation

struct Box<T: Hashable>: Hashable {
  let value: T
}

struct MyHashable {
  
  let base: Any
  
  init<V: Hashable>(_ base: V) {
    self.base = base
  }
}

let box = Box(value: "Hello")

let anyBox = AnyHashable(box)
let anyMy = MyHashable(box)

anyBox as! Box<String>
anyBox.base as! Box<String>

//anyMy as! Box<String>
anyMy.base as! Box<String>
