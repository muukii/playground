//
//  main.swift
//  PropertyDelegate
//
//  Created by muukii on 2019/06/06.
//  Copyright © 2019 eure. All rights reserved.
//

import Foundation

@propertyDelegate struct Muukii {
  
  init() {
    
  }
  
  var value: String {
    get {
      return ""
    }
    set {
      
    }
  }
}

@Muukii var name: String

