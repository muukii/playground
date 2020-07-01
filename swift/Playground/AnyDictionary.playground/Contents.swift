import Cocoa

struct A {
  struct ID: Hashable {
    let raw: String
  }
}

struct B {
  struct ID: Hashable {
    let raw: String
  }
}


var root: [String : UnsafeRawPointer] = [:]

func add(table: UnsafePointer<[A.ID : A]>, for key: String) {
  root[key] = UnsafeRawPointer.init(table)
}

func run() {
  
  var tableA: [A.ID : A] = [:]

  tableA[.init(raw: "1")] = A()
  add(table: &tableA, for: "a")
}

run()

let p = UnsafePointer<[A.ID : A]>.init(OpaquePointer.init(root["a"]))

p?.pointee

//tableA[.init(raw: "2")] = A()

p?.pointee

