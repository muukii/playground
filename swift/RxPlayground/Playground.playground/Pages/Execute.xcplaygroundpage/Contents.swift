//: [Previous](@previous)

import Foundation

import RxSwift
import RxCocoa
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

extension ObservableType {

  /// Observableを実行
  ///
  /// 戻り値をsubscribeしなくても実行されます。
  ///
  /// - Parameter disposeBag: このdisposeBagが存在するまで実行されます。
  /// - Returns: 結果をshareReplay(1)で渡します。
  @discardableResult
  public func execute(_ disposeBag: DisposeBag) -> Observable<E> {

    let s = shareReplay(1)
    s.subscribe().addDisposableTo(disposeBag)

    return s
  }
}

let o = Observable<Int>.create { o in

  DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: { 

    o.onNext(1)
    o.onCompleted()
  })

  return Disposables.create()
}

var serviceDisposeBag = DisposeBag()
var viewModelDisposeBag = DisposeBag()

o
  .debug()
  .execute(serviceDisposeBag)
  .subscribe()
  .addDisposableTo(viewModelDisposeBag)

viewModelDisposeBag = DisposeBag()
serviceDisposeBag = DisposeBag()

//: [Next](@next)
