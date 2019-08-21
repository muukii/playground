import Foundation

class ModelA {

  var name: String {
    return storage.name!
  }

  private var storage: Root

  init(storage: Root) {
    self.storage = storage
  }
}

class ModelB {

  var name: String {
    return storage.name!
  }

  var age: Int {
    return storage.age!
  }

  private var storage: Root

  init(storage: Root) {
    self.storage = storage
  }
}

let root = Root.init()
root.age = 10
root.name = "Hiroshi"

ModelA.init(storage: root)

ModelB.init(storage: root)
