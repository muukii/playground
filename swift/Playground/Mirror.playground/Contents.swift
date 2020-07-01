import Cocoa

protocol EntityType {
  
  static var backingType: Any.Type { get }
}

struct Box<T>: EntityType {
  static var backingType: Any.Type {
    T.self
  }
  
}

struct Database {
  
  let a: Box<String> = .init()
  let b: Box<Int> = .init()
  let name: String = ""
  
}

let database = Database()

for child in Mirror(reflecting: database).children {
  if child.value is EntityType {
    
    print(type(of: (child.value as! EntityType)).backingType)
    print(child.label)
  }
}
