//: [Previous](@previous)

import Foundation

import RxSwift
import RxCocoa

enum State {
  case visible
  case invisible
}

do {
  let storedState: State = .visible

  // VM
  let m = PublishSubject<State>()

  m
    .startWith(storedState)
    .distinctUntilChanged()
    .skip(1)
//    .debug()
    .bindNext { _ in
      // refresh
  }
  
  m.onNext(.visible)
}

do {

  let state = Variable<State>(.visible)

  state.asObservable()
    .distinctUntilChanged()
    .skip(1)
    .debug()
    .bindNext { _ in
      // refresh
  }

  state.value = .visible
  state.value = .invisible
}

//: [Next](@next)
