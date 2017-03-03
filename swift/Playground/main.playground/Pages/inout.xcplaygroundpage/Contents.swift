//: [Previous](@previous)

import Foundation

struct User {
  var nickname: String = "default"
}

func update(user: inout User) {
  user.nickname = "abc"
}

var user = User()
user.nickname

/*:
 inout
 */
update(user: &user)

user.nickname

//: [Next](@next)
