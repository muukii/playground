//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import RxSwift
import RxCocoa

PlaygroundPage.current.needsIndefiniteExecution = true

do {
  
  var disposeBag: DisposeBag? = DisposeBag()
  
  Observable.just(1)
    .flatMap { _ in
      Observable<Int>.create { o in
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
          o.onNext(2)
          o.onCompleted()
        })
        
        return Disposables.create {
          
        }
      }
    }
    .debug()
    .subscribe()
    .disposed(by: disposeBag!)
  
  disposeBag = nil
}

do {
  
  var disposeBag: DisposeBag? = DisposeBag()
  
  Observable.just(1)
    .observeOn(SerialDispatchQueueScheduler(qos: .default))
    .flatMap { _ in
      Observable<Int>.create { o in
        
        Thread.sleep(forTimeInterval: 1)
        o.onNext(2)
        o.onCompleted()
        
        return Disposables.create {
          print("dispose")
        }
      }
    }
    .debug()
    .subscribe()
    .disposed(by: disposeBag!)
  
  disposeBag = nil
}

//: [Next](@next)
