//
//  AnonymousPublisherView.swift
//  CombineApp
//
//  Created by muukii on 2019/08/22.
//  Copyright © 2019 muukii. All rights reserved.
//

import Foundation

import SwiftUI
import Combine

var cancelBag: Set<AnyCancellable> = .init()

struct AnonymousPublisherView: View {

  var body: some View {
    Text("AnonymousPublisher")
      .onAppear {

        let task = AnonymousPublisher<Int, Never> { subscriber in
          DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            subscriber.receive(10)
            subscriber.receive(30)
          }
          subscriber.receive(subscription: CancelTaskSubscription(cancel: {
            print("Source cancelled")
          }))
        }

        task
          .print()
          .sink { (value) in
            print(value)
        }
        .store(in: &cancelBag)
//        .cancel()
    }
  }
}
