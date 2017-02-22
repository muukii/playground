//: [Previous](@previous)

import RxSwift
import RxCocoa

struct ProcessingToken<E>: ObservableConvertibleType, Disposable {

  private let _source: Observable<E>
  private let _dispose: Cancelable

  init(source: Observable<E>, disposeAction: @escaping () -> Void) {
    _source = source
    _dispose = Disposables.create(with: disposeAction)
  }

  func dispose() {
    _dispose.dispose()
  }

  func asObservable() -> Observable<E> {
    return _source
  }
}

class ProcessingTracker {

  private let _changed: (Bool) -> Void

  init(changed: (Bool) -> Void) {
    _changed = changed
  }

  func trackProcessingOfObservable<O: ObservableConvertibleType>(_ source: O) -> Observable<O.E> {
    return Observable.using({ () -> ProcessingToken<O.E> in
      self._changed(true)
      return ProcessingToken<O.E>(source: source.asObservable(), disposeAction: {
        self._changed(false)
      })
    }) { t in
      return t.asObservable()
    }
  }
}

extension ObservableConvertibleType {

  func trackProcessing(_ processing: ProcessingTracker) -> Observable<E> {
    return processing.trackProcessingOfObservable(self)
  }

}

let s = PublishSubject<Void>()

let processing = ProcessingTracker(start: { 
  print("start")
}, finish: {
  print("finish")
})

s.trackProcessing(processing)
  .subscribe()

s.onNext()
s.onNext()
s.onCompleted()


//: [Next](@next)
