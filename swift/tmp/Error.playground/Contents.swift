import Foundation

enum MyError : CustomNSError, LocalizedError {

  public static var errorDomain: String { return "jp.eure.pairs.service.loggedIn" }

  case hoge

  var errorDescription: String? {
    return String(describing: self)
  }
}

print(MyError.hoge.localizedDescription)
