//: [Previous](@previous)

import Foundation

class Service<T> {
  
  init(type: T.Type) {
    Startup<T>().run()
  }
}

protocol StartupType {
  associatedtype T
  func run()
}

struct Startup<T>: StartupType {
}

extension StartupType {
  func run() {
    print("empty", T.self)
  }
}

extension StartupType where T == Int {
  func run() { print("int") }
}


Service.init(type: Int.self)


//: [Next](@next)
