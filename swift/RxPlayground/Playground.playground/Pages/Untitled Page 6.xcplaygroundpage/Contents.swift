//: [Previous](@previous)

import Foundation
import RxSwift
import RxCocoa

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class Ref {
  deinit {
    print("deinit")
  }
}

let backgroundScheduler = ConcurrentDispatchQueueScheduler(qos: .default)

func makeTask() -> Single<Void> {

  let task = Single<Void>.create { o in

    let ref = Ref()

    DispatchQueue.global(qos: .default).async {

      Thread.sleep(forTimeInterval: 3)

      o(.success(()))
    }

    return Disposables.create {
      print("Dispose")
      print(ref)
    }
  }
  return task
}

let queue = PublishRelay<Single<Void>>()

queue
  .debug("1")
  .map {
    $0.subscribeOn(backgroundScheduler)
  }
  .flatMapLatest {
    $0
  }
  .debug("2")
  .subscribe()

queue.accept(makeTask())
queue.accept(makeTask())


//: [Next](@next)
