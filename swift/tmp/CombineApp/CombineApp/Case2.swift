//
//  Case2.swift
//  CombineApp
//
//  Created by muukii on 2019/06/27.
//  Copyright © 2019 muukii. All rights reserved.
//

import Foundation
import Combine

enum Case2 {
  
  static func run() {
    
    let future = Future<Int, Never> { promise in
      print("Future run")
      DispatchQueue.global().async {
        promise(.success(3))
        print("Future done")
      }
    }
    
//    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//      let s = future.sink { (value) in
//        print(value)
//      }
//    }
//
//    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//      let s = future.sink { (value) in
//        print(value)
//      }
//    }
    
  }
}
