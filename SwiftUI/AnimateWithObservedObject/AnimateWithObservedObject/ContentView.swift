//
//  ContentView.swift
//  AnimateWithObservedObject
//
//  Created by muukii on 2019/12/01.
//  Copyright © 2019 muukii. All rights reserved.
//

import SwiftUI

class Store: ObservableObject {
  
  @Published var flag = false
}

let _global_store = Store()

struct ContentView: View {
  
  @ObservedObject var store: Store
  
  var body: some View {
    VStack {
      ProcessingOverlayView(isProcessing: store.flag) {
        Button(action: {
          self.store.flag.toggle()
          DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.store.flag.toggle()
          }
        }) {
          Text("Toggle")
        }
      }
    }
  }
}

struct ProcessingOverlayView<Content: View>: View {
  
  var isProcessing: Bool
  let content: Content
  
  init(isProcessing: Bool, @ViewBuilder content: () -> Content) {
    self.isProcessing = isProcessing
    self.content = content()
  }
  
  var body: some View {
    
    ZStack {
      content
      ActivityIndicator(isAnimating: true, style: .medium)
        .padding(32)
        .background(
          Color.init(white: 0.9, opacity: 0.7)
            .mask(RoundedRectangle(cornerRadius: 16, style: .continuous))
      )
        .opacity(isProcessing ? 1 : 0)
        .animation(.easeInOut)
    }
  }
}

struct ActivityIndicator: UIViewRepresentable {
  
  var isAnimating: Bool
  let style: UIActivityIndicatorView.Style
  
  func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
    return UIActivityIndicatorView(style: style)
  }
  
  func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
    isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(store: _global_store)
  }
}
