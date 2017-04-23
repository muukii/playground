//: [Previous](@previous)

import Foundation

import RxSwift
import RxCocoa
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

public class ExecuteToken {
  
  var disposable: Disposable?
  
  init() {
    
  }
  
  func cancel() {
    disposable?.dispose()
  }
}

extension ObservableType {

  /// Observableを実行
  ///
  /// 戻り値をsubscribeしなくても実行されます。
  ///
  /// - Parameter disposeBag: このdisposeBagが存在するまで実行されます。
  /// - Returns: 結果をshareReplay(1)で渡します。
  @discardableResult
  public func execute(_ disposeBag: DisposeBag, token: ExecuteToken) -> Observable<E> {
    
    let a = publish()
    
    let s = a.shareReplay(1)
    s.subscribe().disposed(by: disposeBag)
    
    let d = a.connect()
    token.disposable = d
    d.disposed(by: disposeBag)
    
    return s
  }
}

let o = Observable<Int>.create { o in
  
  print("began")

  DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {

    print("perform")
    o.onNext(1)
    o.onCompleted()
  })

  return Disposables.create {
    print("dispose")
  }
}
.debug()

let token = ExecuteToken()

var serviceDisposeBag = DisposeBag()
var viewModelDisposeBag = DisposeBag()

let s = o
  .execute(serviceDisposeBag, token: token)

s
  .debug()
  .subscribe()
  .addDisposableTo(viewModelDisposeBag)

s
  .debug()
  .subscribe()
  .addDisposableTo(viewModelDisposeBag)

viewModelDisposeBag = DisposeBag()
//serviceDisposeBag = DisposeBag()

DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
  
  token.cancel()
})




//: [Next](@next)
