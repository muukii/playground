import RxSwift
import RxCocoa

let s = PublishSubject<Void>()

// Optional<Optional<Int>> -> Optional<Int>
// Optional(Optional(Optional(Optional(Optional("a")))))

let text: String????? = "a"
print(text)
let r = text.flatMap { $0 }.flatMap { $0 }.flatMap { $0 }.flatMap { $0 }
print(r)

// Observable<Observable<Int>> -> Observable<Int>

s
  .debug()
  .flatMap { Void -> Observable<Int> in
    Observable.just(3)
  }
  .debug()
  .subscribe()

s.onNext()