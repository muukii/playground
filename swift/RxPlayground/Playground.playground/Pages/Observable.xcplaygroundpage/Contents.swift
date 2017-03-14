import RxCocoa
import RxSwift

extension String : Error {

}

class Retain {
  deinit {
    print("deinit")
  }
}

var retain: Retain? = Retain()

let o = Observable<Int>.create { o in

  o.onNext(100)

  return Disposables.create {
    print("disposed")
  }
}

let disposable = o.debug().subscribe()
retain = nil
print("o")

//disposable.dispose()
