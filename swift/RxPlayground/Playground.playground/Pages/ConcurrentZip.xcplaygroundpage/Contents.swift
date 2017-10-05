import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

func task(_ s: Int) -> Observable<Void> {
  return Observable.create { o in
    print("begin", s)
    sleep(1)
    print("end", s)
    o.onNext(())
    o.onCompleted()
    return Disposables.create()
  }
}

//let s = SerialDispatchQueueScheduler(qos: .default)
//let s: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .default)
//let s = CurrentThreadScheduler.instance

let q = OperationQueue()
q.maxConcurrentOperationCount = 2
let s = OperationQueueScheduler(operationQueue: q)

Observable.zip([
  task(1).subscribeOn(s),
  task(2).subscribeOn(s),
  task(3).subscribeOn(s),
  task(4).subscribeOn(s),
  ])
  .subscribe()
