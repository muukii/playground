//
//  ContentView.swift
//  SwiftMattt
//
//  Created by muukii on 2019/09/12.
//  Copyright © 2019 muukii. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  struct AppState {
    var flag: Bool = false
    var a = 1
  }
  
  @State var state: AppState = .init()
    
  var body: some View {
                         
    VStack {
      
      Toggle(isOn: $state.flag) {
        Text("abc")
      }
      
      if state.flag {
        Text("Hello World")
      } else {
        Text("Hello")
      }
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
