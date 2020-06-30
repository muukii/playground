import Foundation
import RxSwift
import PlaygroundSupport

PlaygroundSupport.PlaygroundPage.current.needsIndefiniteExecution = true

public final class SequenceQueue {

  fileprivate let queueSubject = PublishSubject<Single<Void>>()

  private var current: Disposable?

  private let lock = NSLock()

  public init() {
    purgeCurrentItem()
  }

  public func purgeCurrentItem() {

    lock.lock(); defer { lock.unlock() }
    self.current?.dispose()
    self.current = queueSubject
      .concat()
      .debug()
      .subscribe()
  }
}

extension PrimitiveSequence where Trait == SingleTrait {

  public func wait(in queue: SequenceQueue) -> Single<Element> {

    let booleanDisposable = BooleanDisposable()

    var connection: Disposable?

    let connectable = self.asObservable().share().replay(1)

    let wrapped = Single<Void>.create { observer in

      guard !booleanDisposable.isDisposed else {
        observer(.success(()))
        return Disposables.create {}
      }

      connection = connectable.connect()
      return Disposables.create([
        connectable.map { _ in }.asSingle().subscribe(observer),
        connection
        ].compactMap { $0 })
    }

    queue.queueSubject.onNext(wrapped)

    return Single<Element>.create { observer in

      return Disposables.create([
        booleanDisposable,
        connectable.asSingle().subscribe(observer),
        Disposables.create {
          connection?.dispose()
        }
        ].compactMap { $0 })

    }

  }
}

let queue = SequenceQueue()

func make(_ num: Int) -> Single<String> {
  return .create { observer in

    let now = Date()

    print("subscribe, \(num)")

    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      print("emit", num)
      observer(.success("Hello \(num) \(Thread.current)"))
    }

    return Disposables.create {
      print("dispose", num)
    }
  }
}

//make(1)
//  .enqueue(on: queue)
//  .subscribe()
//
//make(2)
//  .enqueue(on: queue)
//  .subscribe()
//

make(3)
  .wait(in: queue)
  

let sub = make(4)
  .wait(in: queue)
  .debug()
  .subscribe()

DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
  queue.purgeCurrentItem()
//  sub.dispose()
}
