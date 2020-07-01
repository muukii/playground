//
//  main.swift
//  Buffer
//
//  Created by muukii on 2019/09/03.
//  Copyright © 2019 muukii. All rights reserved.
//

import Foundation

class Partner {
  
  let buffer: [String : Any]
  
  @Getter<String> var foo: String = Getter<String>(buffer: buffer, decoder: {})
}

@propertyWrapper
struct Getter<T> {
      
  var wrappedValue: T? {
    nil
  }
  
  init(buffer: [String : Any], decoder: () -> Void) {
    
  }
}

let p = Partner(buffer: [:])

print(p.foo)
