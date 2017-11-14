//: [Previous](@previous)

import RxSwift
import RxCocoa

var source: PublishSubject<Int>! = PublishSubject<Int>.init()

let another: PublishSubject<Int>! = PublishSubject<Int>.init()

Observable.using({
  CompositeDisposable.init(disposables: [
    another.asObservable().debug().subscribe()
    ])
}) { (d) -> Observable<Int> in
  source.asObservable()
}
.debug()
.subscribe()

source.onNext(1)
source.onCompleted()
source.dispose()
source = nil

//: [Next](@next)
