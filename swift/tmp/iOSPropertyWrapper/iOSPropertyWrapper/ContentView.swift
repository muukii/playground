//
//  ContentView.swift
//  iOSPropertyWrapper
//
//  Created by muukii on 2019/06/06.
//  Copyright © 2019 eure. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        Text("Hello World")
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

class Playground {
  @propertyDelegate struct Muukii<T> {
    var value: T {
      get {
        fatalError()
      }
      nonmutating set {
        
      }
    }
  }
  
  @Muukii var name: String
  
  init() {
    
  }
}
