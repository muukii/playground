//: [Previous](@previous)

class DeinitBox {
  deinit {
    print("Deinit")
  }
}

import RxSwift

DispatchQueue.main.async {
  let s = BehaviorSubject<Int?>.init(value: nil)
  s.hasObservers
  s.flatMap { _ -> Observable<Void> in
    Observable<Void>.create { o in
      
      DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
        o.onNext(())
        o.onCompleted()
      }
                  
      return Disposables.create {
        print("dd")
      }
    }
  }
  .subscribe()
  
  s.onCompleted()
  
  DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
    print("Done")
  }
}

//: [Next](@next)
