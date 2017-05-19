//: [Previous](@previous)

import Foundation

protocol ModelType {
  
  associatedtype IdentityType
  var identity: IdentityType
}

class ModelStore {
  
  var dictionary: [String : Any] = [String : Any].init(minimumCapacity: 1000)
  
}

//: [Next](@next)
