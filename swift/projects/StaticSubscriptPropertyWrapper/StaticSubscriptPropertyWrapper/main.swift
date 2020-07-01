//
//  main.swift
//  StaticSubscriptPropertyWrapper
//
//  Created by muukii on 2019/09/05.
//  Copyright © 2019 muukii. All rights reserved.
//

import Foundation


@propertyWrapper struct Property {
  
  static subscript(
    _enclosingInstance instance: Model,
    wrapped wrappedKeyPath: KeyPath<Model, Int?>,
    storage storageKeyPath: WritableKeyPath<Model, Property>
  ) -> Int? {
    
    let key = instance[keyPath: storageKeyPath].key
    return instance.storage[key]
  }
  
  @available(*, unavailable)
  var wrappedValue: Int? {
    fatalError()
  }
  
  var projectedValue: Self { self }
    
  let key: String
  
  init(_ key: String) {
    self.key = key
  }
  
}

struct Model {
  
  let storage: [String : Int] = [
    "a" : 1,
    "b" : 2,
    "c" : 3,
  ]
  
  @Property("a") var foo: Int?
  
}

//enum Static {
//  @Property("a") static var foo: Int?
//}


var model = Model()

print(model.foo as Any) // Optional(1)
