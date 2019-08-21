//: [Previous](@previous)

import RxSwift

extension Observable {
  
  func myMap<U>(_ transform: @escaping (Element) -> U) -> Observable<U> {
    
    return Observable<U>.create { observer in
      
      let disposable = self.subscribe { event in
        switch event {
        case .next(let e):
          observer.onNext(transform(e))
        case .error(let r):
          observer.onError(r)
        case .completed:
          observer.onCompleted()
        }
      }
      
      return disposable
    }
  }
}

Observable.just(6)
  .myMap { $0 * 3 }
  .debug()
  .subscribe()

//: [Next](@next)
