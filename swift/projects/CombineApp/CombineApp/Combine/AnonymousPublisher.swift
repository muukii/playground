//
//  AnonymousPublisher.swift
//  CombineApp
//
//  Created by muukii on 2019/08/22.
//  Copyright © 2019 muukii. All rights reserved.
//

import Foundation
import Combine

// for playground
public struct CancelTaskSubscription: Subscription {

  public let combineIdentifier: CombineIdentifier = .init()

  private let _cancel: () -> Void

  public init(cancel: @escaping () -> Void) {
    self._cancel = cancel
  }

  public func request(_ demand: Subscribers.Demand) {

  }

  public func cancel() {
    print(self, "cancel")
    _cancel()
  }
}

public struct AnonymousPublisher<Output, Failure: Swift.Error>: Publisher {

  private let _subscribe: (AnySubscriber<Output, Failure>) -> Void

  public init(_ subscribe: @escaping (AnySubscriber<Output, Failure>) -> Void) {
    self._subscribe = subscribe
  }

  public func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
    subscriber.receive(subscription: AnonymousSubscription(subscriber: subscriber, source: _subscribe))
  }
}

public final class AnonymousSubscription<S: Subscriber>: Subscription {

  public let combineIdentifier: CombineIdentifier = .init()
  let subscriber: S
  let source: (AnySubscriber<S.Input, S.Failure>) -> Void
  private var wasCancelled: Bool = false
  private var subscription: Subscription?

  init(subscriber: S, source: @escaping (AnySubscriber<S.Input, S.Failure>) -> Void) {
    self.subscriber = subscriber
    self.source = source

    source(AnySubscriber<S.Input, S.Failure>(
      receiveSubscription: { (subscription) in
        self.subscription = subscription
    },
      receiveValue: { (value) -> Subscribers.Demand in
        guard !self.wasCancelled else {
          return .unlimited
        }
        return subscriber.receive(value)
    },
      receiveCompletion: { result in
        subscriber.receive(completion: result)
    }))
  }

  public func request(_ demand: Subscribers.Demand) {
    // what should we do?
  }

  public func cancel() {
    subscription?.cancel()
    wasCancelled = true
  }

}

//: [Next](@next)
