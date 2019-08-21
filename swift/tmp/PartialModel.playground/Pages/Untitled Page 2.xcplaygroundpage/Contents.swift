//: [Previous](@previous)

/*:

 # Using Proxy Object

 */

protocol StorageType {}
protocol TargetType {}

enum Grid : TargetType {}
enum Detail : TargetType {}

/// Storage is root model
/// Target is the accessor for storage
struct Partial<Storage : StorageType, Target : TargetType> {

  var storage: Storage
}

extension Root : StorageType {

}

extension Partial where Storage == Root, Target == Grid {

  var name: String {
    return storage.name!
  }

  init(storage: Storage) throws {
    print("Init Grid")
    self.storage = storage
  }
}

extension Partial where Storage == Root, Target == Detail {

  var age: Int {
    return storage.age!
  }

  init(storage: Storage) throws {
    print("Init Detail")
    self.storage = storage
  }
}

let storage = Root()

let grid = try Partial<Root, Grid>(storage: storage)
let detail = try Partial<Root, Detail>(storage: storage)

//: [Next](@next)
