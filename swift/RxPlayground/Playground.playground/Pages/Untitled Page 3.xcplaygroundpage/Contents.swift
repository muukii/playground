//: [Previous](@previous)

import RxSwift

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

extension Observable {
  
  func subscribeUntilComplete(on disposeBag: DisposeBag) -> Observable<Element> {
    
    let s = self.asObservable().replay(1)
    s.subscribe().disposed(by: disposeBag)
    
    return s
      .do(
        onSubscribe: {
          s.connect().disposed(by: disposeBag)
      },
        onDispose: {
      })
  }
}

extension PrimitiveSequence where Trait == SingleTrait {
  
  func subscribeUntilComplete(on disposeBag: DisposeBag) -> Single<Element> {
    
    return asObservable().subscribeUntilComplete(on: disposeBag).asSingle()
  }
}

let d = DisposeBag()

func operation() -> Single<Void> {
  
  let task = Single.just(1)
    .flatMap { _ in
      Single<Void>.create { o in
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
          print("task1 end")
          o(.success())
        })
        
        return Disposables.create()
      }
    }
    .flatMap { _ in
      Single<Void>.create { o in
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
          print("task2 end")
          o(.success())
        })
        
        return Disposables.create()
      }
    }
    .debug()
    .asObservable()
    .take(0.8, scheduler: MainScheduler.instance)
    .asSingle()
    .subscribeUntilComplete(on: d)
    .debug()
  
  return task
}


let t = operation()

t.debug().subscribe().dispose()

//: [Next](@next)
