//: [Previous](@previous)

import Foundation

func foo(a: () -> Void = {}, b: () -> Void = {}) {
  print("perform 1")
}

foo {
  
}

func perform(a: () -> Void = {}, b: () -> Void = {}) {
  print("perform 1")
}

func perform(a: () -> Void) {
  print("perform 2")
}

perform {

}

perform(b: {

})
//: [Next](@next)
