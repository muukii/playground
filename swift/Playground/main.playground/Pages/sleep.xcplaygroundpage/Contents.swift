//: [Previous](@previous)

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

func wait(seconds: Double) {
  let factor = 1000 * 1000
  let microseconds = seconds * Double(factor)
  usleep(useconds_t(microseconds))
}

Thread.sleep(forTimeInterval: 0.3)
//: [Next](@next)
