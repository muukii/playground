//: [Previous](@previous)

import RxSwift

class Box {
  let name: String
  init(name: String) {
    self.name = name
  }
  deinit {
    print("Deinit", name)
  }
}

func makeTask(name: String) -> Single<Int> {
  Single<Int>.create { (observer) -> Disposable in
    
    let box = Box(name: name)

    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
      observer(.success(1))
    }
        
    return Disposables.create {
      box
    }
  }
}

store: do {
  var disposeBag = Optional.some(DisposeBag())
  makeTask(name: "store").debug("store").subscribe().disposed(by: disposeBag!)
  disposeBag = nil
}

noStore: do {
  makeTask(name: "noStore").debug("noStore").subscribe()
}

//: [Next](@next)
