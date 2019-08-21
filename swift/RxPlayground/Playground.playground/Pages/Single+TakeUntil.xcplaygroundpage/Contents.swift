//: [Previous](@previous)

import RxSwift

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

import RxSwift

public enum RxFutureError : Error {
  case wasCancelled
}

/// Item for subscribing primitive sequence
///
public struct RxFuture<E> {
  
  public typealias RxPromise<E> = Single<E>
  
  /// Reactive style for receive notification for completion of this task.
  /// It's already shared and replaying.
  /// It will broadcast result, even if this task already completed.
  public let result: RxPromise<E>
  
  private let cancelTrigger = PublishSubject<Void>()
  
  public static func create(_ observer: @escaping (@escaping (SingleEvent<E>) -> ()) -> Disposable) -> RxFuture<E> {
    
    return .init { Single<E>.create(subscribe: observer) }
  }
  
  public static func succeed(_ value: E) -> RxFuture<E> {
    return Single<E>.just(value).start()
  }
  
  public static func fail(_ error: Swift.Error) -> RxFuture<E> {
    return Single<E>.error(error).start()
  }
  
  init(_ make: () -> RxPromise<E>) {
    
    var subscription: Disposable?
    
    let promise = make()
      .asObservable()
      .takeUntil(cancelTrigger)
      .catchError { error in
        guard case RxError.noElements = error else {
          throw error
        }
        throw RxFutureError.wasCancelled
      }
//      .do(onDispose: { _ = subscription })
//      .share(replay: 1, scope: .forever)
      .share(replay: 1, scope: .whileConnected)

      .asSingle()
    
    // Single will be disposed when observed success or error.
    subscription = promise.subscribe()
    print(subscription)
    
    self.result = promise
  }
  
  /// Add notification closure for completion for this task.
  ///
  /// - Parameter execute:
  /// The closure will be called, even if this task already completed.
  public func addCompletion(_ execute: @escaping (SingleEvent<E>) -> Void) {
    _ = result.subscribe(execute)
  }
  
  /// Cancel task
  public func cancel() {
    cancelTrigger.onNext(())
  }
}

extension RxFuture {
  
  public func then<U>(_ closure: @escaping (E) throws -> RxFuture<U>) -> RxFuture<U> {
    return
      result
        .flatMap { e in
          try closure(e).result
        }
        .start()
  }
}

extension PrimitiveSequence where Trait == SingleTrait {
  
  /// Subscribe and returns RunningTask
  ///
  /// - Returns:
  @discardableResult
  public func start(observeScheduler: SchedulerType = MainScheduler.asyncInstance) -> RxFuture<Element> {
    return RxFuture { observeOn(observeScheduler) }
  }
  
}


/////////////////////////////////////////////////////////////////

class Box {
  
}

func sendLike() -> RxFuture<Int> {
  return
    Single<Int>.create { o in
      
      let box = Box()

      DispatchQueue.global().asyncAfter(deadline: .now() + 2, execute: { [weak box] in
        
        guard let box = box else {
          print("Box was deallocated")
          return
        }

        print("Success")
        o(.success(10))
      })

      return Disposables.create {
        print("Task disposed", box)
      }
      }
      .start()
}

sendLike()

//: [Next](@next)
