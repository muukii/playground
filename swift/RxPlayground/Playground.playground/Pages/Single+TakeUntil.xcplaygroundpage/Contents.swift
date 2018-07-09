//: [Previous](@previous)

import RxSwift

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

public enum RunningTaskError : Error {
  case cancelled
}

/// Item for subscribing primitive sequence
///
public struct RunningTask<E> {

  public typealias SharedSingle<E> = Single<E>

  /// Reactive style for receive notification for completion of this task.
  /// It's already shared and replaying.
  /// It will broadcast result, even if this task already completed.
  public let result: SharedSingle<E>

  private let cancelTrigger = PublishSubject<Void>()

  init(_ make: () -> Single<E>) {

    let task = make()
      .asObservable()
      .takeUntil(cancelTrigger)
      .catchError { error in
        guard case RxError.noElements = error else {
          throw error
        }
        throw RunningTaskError.cancelled
      }
      .share(replay: 1, scope: .forever)
      .asSingle()

    // Single will be disposed when observed success or error.
    _ = task.subscribe()

    self.result = task
  }

  /// Cancel task
  public func cancel() {
    cancelTrigger.onNext(())
  }
}

extension PrimitiveSequence where Trait == SingleTrait {

  /// Subscribe and returns RunningTask
  ///
  /// - Returns:
  public func start() -> RunningTask<Element> {
    return RunningTask { self }
  }
}

/////////////////////////////////////////////////////////////////

func sendLike() -> RunningTask<Int> {
  return
    Single<Int>.create { o in

      DispatchQueue.global().asyncAfter(deadline: .now() + 2, execute: {

        o(.success(10))
      })

      return Disposables.create {

        print("Task disposed")
      }
      }
      .start()
}


//: [Next](@next)
