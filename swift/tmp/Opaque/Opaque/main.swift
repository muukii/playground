//
//  main.swift
//  Opaque
//
//  Created by muukii on 2019/06/14.
//  Copyright © 2019 muukii. All rights reserved.
//

import Foundation

func run() -> some Hashable {
  if true {
    return "Hello"
  } else {
    return 888
  }
}

run().hashValue

