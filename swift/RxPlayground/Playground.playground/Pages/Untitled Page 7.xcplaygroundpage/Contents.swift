//: [Previous](@previous)

import RxSwift
import RxCocoa

class Store {

  var currentToken: String? = nil
}

class Service {

  let store: Store

  init(store: Store) {
    self.store = store
  }

  func getToken() -> Single<String> {
    return .just("")
  }
}

// [] -> [] -> []

final class TokenProvider {

  private let _token: BehaviorRelay<String?> = .init(value: nil)

  let _refresh: () -> Single<String>
  private var isRefreshing = false

  private let lock: NSLock = .init()

  init(refresh: @escaping () -> Single<String>) {
    self._refresh = refresh
  }

  func token() -> Single<String> {
    return _token
      .filter { $0 != nil }
      .map { $0! }
      .take(1)
      .asSingle()
  }

  func refresh() -> Single<String> {

    lock.lock(); defer { lock.unlock() }

    guard isRefreshing == false else { return
      return token()
    }

    isRefreshing = true
    _token.accept(nil)

    return self._refresh()
      .do(onSuccess: { a in
        self.isRefreshing = false
        self._token.value = a
      })
      .map { _ in self._token.value! }
  }
}

















