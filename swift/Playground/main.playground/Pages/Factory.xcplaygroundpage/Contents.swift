//: [Previous](@previous)

import Foundation

struct User {

  let nickname: String
  let age: Int
  let height: Int

  static func a_User(age: Int) -> User {
    return User(nickname: "", age: age, height: 100)
  }

  static func b_User(age: Int) -> User {
    return User(nickname: "", age: age, height: 100)
  }

  static func c_User(age: Int) -> User {
    return User(nickname: "", age: age, height: 100)
  }
}

//: [Next](@next)
