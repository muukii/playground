//
//  main.swift
//  KeyPath
//
//  Created by muukii on 2019/09/02.
//  Copyright © 2019 muukii. All rights reserved.
//

import Foundation

struct Buffer {
  let a: String?
  let b: String?
}

protocol Partial {
  
}

protocol AAA: Partial {
  var a: String { get }
}

@dynamicMemberLookup
struct Box<Root: Partial> {
  
  let root: Any
  
  subscript<T>(dynamicMember keyPath: KeyPath<Root, T>) -> T {
    return root[keyPath: keyPath]
  }
  
  subscript<T>(dynamicMember keyPath: KeyPath<Root, T?>) -> T? {
    return root[keyPath: keyPath]
  }
}

Box<AAA>(root: Buffer(a: "a", b: "b"))
