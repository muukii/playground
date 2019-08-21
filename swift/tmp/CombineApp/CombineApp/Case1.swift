//
//  Case1.swift
//  CombineApp
//
//  Created by muukii on 2019/06/27.
//  Copyright © 2019 muukii. All rights reserved.
//

import Foundation
import Combine

enum SomeError : Swift.Error {}

enum Case1 {
  
  public static func run() {
    
    /*
    
    Just("")
    
    Just("Hello")
      .map { $0 + "" }
        
    let _ = Just("Hello")
      .sink { v in
        print(v)
    }
    
    AnyPublisher<String, Never>.init(<#T##publisher: Publisher##Publisher#>)
    
    
    let publisher = AnyPublisher<String, Never> { subscriber in
      
      print("Receive", subscriber.receive("0"))
      
      DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
        print("Receive", subscriber.receive("a"))
        
        DispatchQueue.global().async {
          print("Receive", subscriber.receive("b"))
          
          subscriber.receive(completion: .finished)
        }
      }
      
      subscriber.receive(subscription: AnySubscription {
        print("cancel")
      })
      
    }
    
    Future<String, Never> { s in
      s(.success("Future"))
    }
    
    let t = Future<String, Never> { s in
      s(.success("Future"))
    }
    
    t.sink { (v) in
      print(v)
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      t.sink { (v) in
        print(v)
      }
    }
    
    _ = publisher
      .sink { (v) in
        print(v)
    }
    
    _ = publisher
      .sink { (v) in
        print(v)
    }
    */
  }
}
