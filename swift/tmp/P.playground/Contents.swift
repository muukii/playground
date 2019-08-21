protocol ServiceType {
  
}

protocol GenericServiceType : ServiceType {
  associatedtype Target : Hashable
  
  func run() -> Target
}

class Service : GenericServiceType {
  typealias Target = Int
}

extension GenericServiceType {
  func run() -> Target {
    fatalError()
  }
  
  func hoge() {
    
  }
}

let s = Service()

let a = s as ServiceType

a.hoge()
