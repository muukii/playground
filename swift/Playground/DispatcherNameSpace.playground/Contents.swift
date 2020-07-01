import Foundation

struct Dispatch<Base> {
  
  let base: Base
  
  init(base: Base) {
    self.base = base
  }
}

struct Commit<Base> {
  let base: Base
  
  init(base: Base) {
    self.base = base
  }
}

protocol DispatcherType {
  
}

class Dispatcher: DispatcherType {
  
}

extension DispatcherType {
  
  var dispatch: Dispatch<Self> {
    return .init(base: self)
  }
  
  var commit: Commit<Self> {
    return .init(base: self)
  }
}

final class ADispatcher: Dispatcher {
  
}

final class BDispatcher: Dispatcher {
  
}

extension Commit where Base == ADispatcher {
  
  func run() {
    self.base
  }
}

extension Commit where Base == BDispatcher {
  
  func perform() {
    
  }
}


let a = ADispatcher()
let b = BDispatcher()

a.commit.run()

