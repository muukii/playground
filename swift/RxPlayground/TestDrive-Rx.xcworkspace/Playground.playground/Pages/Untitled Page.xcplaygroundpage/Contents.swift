import RxSwift
import RxCocoa

struct RefValue : CustomStringConvertible {
  var value: Int = 0

  var description: String {
    return "🤠" + value.description
  }
}

let s = PublishSubject<RefValue>()

Observable.zip(s, s.skip(1)).debug().subscribe()

var v = RefValue()

s.onNext(v)

v.value = 1

s.onNext(v)

