//
//  ContentView.swift
//  CombineApp
//
//  Created by muukii on 2019/06/06.
//  Copyright © 2019 muukii. All rights reserved.
//

import SwiftUI
import Combine

final class AnySubscription: Subscription {
  private let cancellable: Cancellable
  
  init(_ cancel: @escaping () -> Void) {
    cancellable = AnyCancellable(cancel)
  }
  
  func request(_ demand: Subscribers.Demand) {}
  
  func cancel() {
    cancellable.cancel()
  }
  
  deinit {
    print("deinit \(self)")
  }
}

struct ContentView : View {
    var body: some View {
        Text("Hello World")
          .onAppear {
            
//            Case1.run()
            Case2.run()
//            Case3.run()
                                  
//            publisher.subscribe(
//              AnySubscriber.init(receiveSubscription: { (s) in
//
//                print(s)
//              }, receiveValue: { (v) -> Subscribers.Demand in
//                print(v)
//                return .none
//              }) { (c) in
//                print(c)
//              }
//            )
            
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
