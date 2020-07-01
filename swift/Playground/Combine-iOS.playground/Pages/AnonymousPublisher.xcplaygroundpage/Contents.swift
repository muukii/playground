//: [Previous](@previous)

import Combine
import Foundation

public struct AnonymousPublisher<Output, Failure: Swift.Error>: Publisher {

  private let _subscribe: (AnySubscriber<Output, Failure>) -> Void

  public init(_ subscribe: @escaping (AnySubscriber<Output, Failure>) -> Void) {
    self._subscribe = subscribe
  }

  public func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
    _subscribe(AnySubscriber(subscriber))
    subscriber.receive(subscription: AnonymousSubscription())
  }
}

public struct AnonymousSubscription<SubscriberType: Subscriber>: Subscription {

  init(subscriber: SubscriberType) {
    
  }

  public func request(_ demand: Subscribers.Demand) {
    print("demand", demand)
  }

  public func cancel() {
    print("cancel")
  }

  public let combineIdentifier: CombineIdentifier = .init()

}

let task = AnonymousPublisher<Int, Never> { subscriber in
  DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
    subscriber.receive(10)
    subscriber.receive(30)
  }
}

task
  .print()
  .sink { (value) in
    print(value)
}
.cancel()

//: [Next](@next)
