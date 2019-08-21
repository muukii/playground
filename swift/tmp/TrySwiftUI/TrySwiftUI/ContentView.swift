//
//  ContentView.swift
//  TrySwiftUI
//
//  Created by muukii on 2019/06/03.
//  Copyright © 2019 eure. All rights reserved.
//

import SwiftUI

struct ContentView : View {
  
  var name: String = ""
  
  var body: some View {
    VStack {
      Text("Hello World")
      Text("Hello World")
    }
  }
}



#if DEBUG
struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif
