//
//  ContentView.swift
//  Tabbed
//
//  Created by muukii on 2019/06/04.
//  Copyright © 2019 eure. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State private var selection = 0
 
    var body: some View {
        TabbedView(selection: $selection){
            Text("First View")
                .font(.title)
                .tabItemLabel(Image("first"))
                .tag(0)
            Text("Second View")
                .font(.title)
                .tabItemLabel(Image("second"))
                .tag(1)
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
