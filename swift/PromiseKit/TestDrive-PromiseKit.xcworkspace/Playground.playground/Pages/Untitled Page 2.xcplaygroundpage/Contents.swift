//: [Previous](@previous)

import PromiseKit

func fetch() -> Promise<String> {

  return Promise<[String]> { r in
    r.fulfill(["a", "ab", "abc"])
    }
    .then(on: nil) { v -> Promise<String> in
      .value("hoge")
  }
}

fetch()



//: [Next](@next)
