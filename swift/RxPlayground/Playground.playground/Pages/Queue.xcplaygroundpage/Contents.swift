//: [Previous](@previous)

import Foundation
import RxSwift

Observable<Void>.create { observer in
  
  DispatchQueue.global().async {
    observer.onNext(())
  }
  
  return Disposables.create()
}
.do(onNext: {
  print(Thread.current)
})
.subscribe()



//: [Next](@next)
