//: [Previous](@previous)

import ReactiveSwift
import Result

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let (queue, observer) = Signal<SignalProducer<Void, NoError>, NoError>.pipe()

queue
  .logEvents()
//  .observe(on: QueueScheduler.init(qos: .default, name: "hoge", targeting: nil))
  .flatten(.merge)
  .logEvents()

observer.send(value: SignalProducer<Void, NoError>.init({ (o, l) in
  print(Thread.current)
  o.send(value: ())
  o.sendCompleted()
}))

observer.send(value: SignalProducer<Void, NoError>.init({ (o, l) in
  print(Thread.current)
  o.send(value: ())
  o.sendCompleted()
  o.sendInterrupted()
}))

observer.send(value: SignalProducer<Void, NoError>.init({ (o, l) in
  print(Thread.current)
  o.send(value: ())
  o.sendCompleted()
}))


//: [Next](@next)
