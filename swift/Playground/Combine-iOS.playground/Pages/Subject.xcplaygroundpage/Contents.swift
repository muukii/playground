//: [Previous](@previous)

import Foundation
import Combine
import PlaygroundSupport

let subject = PassthroughSubject<Int, Never>()
var bag: Set<AnyCancellable> = .init()

DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
  subject.send(10)
  _ = bag
}

let c = subject
  .print()
  .sink { _ in }

c.store(in: &bag)

//c.cancel()

//: [Next](@next)
