//: [Previous](@previous)

import Foundation

import RxSwift
import RxCocoa

class User {
  var age: Int = 18
}

func updateInout(user: inout User) {
  user.age = 0
}

let v = Variable(User())

v.asObservable().debug().subscribe()

updateInout(user: &v.value)

//: [Next](@next)
