
import RxSwift
import RxCocoa

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

func taskA() -> Single<String> {
  
  return Single<String>.create { o in
    
    print("Create A")
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
      o(.error("A Error"))
    })
    return Disposables.create()
  }
  
}

func taskB() -> Single<String> {
  
  return Single<String>.create { o in

    print("Create B")
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
      o(.success("B done"))
    })
    
    return Disposables.create()
  }
  
}

func sharedA() -> Single<String> {
  
  let task = taskA().asObservable().share(replay: 1, scope: .forever).asSingle()
  _ = task.subscribe()
  return task
}

func sharedB() -> Single<String> {
  
  let task = taskB().asObservable().share(replay: 1, scope: .forever).asSingle()
  _ = task.subscribe()
  return task
}

let o = Observable.from([
  Single.deferred { sharedA() },
  Single.deferred { sharedB() },
  ])
  .map {
    $0.asObservable().retry()
  }
  .merge()

Observable.from([
  Single.deferred { sharedA() },
  Single.deferred { sharedB() },
  ])
  .merge()
  .debug()
  .retry()
  .takeLast(1)
  .subscribe(onNext: { (value) in
    print(value)
  })
