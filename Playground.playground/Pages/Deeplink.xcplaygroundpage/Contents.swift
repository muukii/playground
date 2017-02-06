//: [Previous](@previous)

import Foundation

let url = URL(string: "myapp://open_url_internal?url=https%3A%2F%2Fdribbble.com%2Fshots")!

enum Deeplink {
  case invalid
  case openURLInternal(URL)

  init(url: URL) {

    guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
      self = .invalid
      return
    }

    let query = (components.queryItems ?? []).reduce([String: String]()) { dic, item in
      var dic = dic
      dic[item.name] = item.value
      return dic
    }

    let host = components.host!
    let path = components.path

    let hostPath = host + path

    switch hostPath {
    case "open_url_internal":
      let url = URL(string: query["url"]!)!
      self = .openURLInternal(url)
    default:
      assertionFailure("Unknown URLScheme")
      self = .invalid
    }
  }
}

Deeplink(url: url)

//: [Next](@next)
