//: [Previous](@previous)

import RxSwift
import RxCocoa

import PlaygroundSupport

enum ErrorStatus : Error {
  case did
}

PlaygroundPage.current.needsIndefiniteExecution = true

let cancelTrigger = PublishSubject<Void>()

let task = Single<Void>.create { o in

  DispatchQueue.global().asyncAfter(deadline: .now() + 1) {

    o(.success(()))
  }
  return Disposables.create()
}


Observable.just(())
  .flatMapLatest {
    Observable.from([
      task.asObservable(),
      Observable<Void>.never().take(0.2, scheduler: MainScheduler.instance)
      ])
      .merge()
  }
  .debug()
  .retryWhen { error in
    error
      .flatMap { error -> Observable<Void> in
        print(error)
        return .just(())
    }
  }
  .debug()
  .subscribe()

DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {

  cancelTrigger.onError(ErrorStatus.did)
}


//: [Next](@next)
