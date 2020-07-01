//
//  ContentView.swift
//  Distinct
//
//  Created by muukii on 2019/09/23.
//  Copyright © 2019 muukii. All rights reserved.
//

import SwiftUI

class External: ObservableObject {
  @Published var flag = false
}

struct ContentView: View {
  
  @ObservedObject var external = External()
  
  var flag: Bool {
    external.flag
  }
  
  var body: some View {
    print("render")
    return VStack {
      Text("\(flag.description)")
      Button(action: {
        self.external.flag = true
      }) {
        Text("Hit!")
          .font(.headline)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
