//: [Previous](@previous)

import Foundation

protocol ServiceStackType: class {
  var a: AService { get }
  var b: BService { get }
}

struct ServiceStackRef {
  
}

protocol ServiceType: class {
  var stack: ServiceStackType { get }
}

class ServiceBase {
  weak var owningServiceStack: ServiceStackType?
  
  deinit {
    print("deinit", self)
  }
}

class AService: ServiceBase {
  
  func run() {
    
    owningServiceStack?.b.run()
  }
}

class BService: ServiceBase {
  
  
  func run() {
    
  }
}

class DataStack {
  
}

class ServiceStack: ServiceStackType {
  
  let a: AService
  let b: BService
  let dataStack = DataStack()
  
  init() {
    self.a = AService()
    self.b = BService()
    
    add(service: self.a)
    add(service: self.b)
  }
  
  func add(service: ServiceBase) {
    
    service.owningServiceStack = self
  }
  
  deinit {
    print("deinit", self)
  }
}

do {
  let stack = ServiceStack()
  
  stack.a.run()
}



//: [Next](@next)
