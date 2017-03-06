//: [Previous](@previous)

import Foundation

class State {
  var stateValue: Int = 0
}

struct User {
  var nickname: String = ""
  var state = State()
}

var user = User()

var copyUser = user

user.nickname = "a"
copyUser.nickname = "b"

copyUser.state.stateValue = 100
user.state.stateValue


//: [Next](@next)
