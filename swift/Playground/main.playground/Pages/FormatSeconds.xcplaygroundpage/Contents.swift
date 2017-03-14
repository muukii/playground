//: [Previous](@previous)

import Foundation

let seconds: Double = 100

let formatter = DateComponentsFormatter()
formatter.zeroFormattingBehavior = .pad
formatter.allowedUnits = [.hour, .minute, .second]
formatter.unitsStyle = .positional
formatter.string(from: seconds)

func format(interval: TimeInterval) -> String {
  let interval = Int(interval)
  let seconds = interval % 60
  let minutes = (interval / 60) % 60
  let hours = (interval / 3600)
  if hours > 0 {
    return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
  } else {
    return String(format: "%02d:%02d", hours, minutes, seconds)
  }
}

format(interval: 100)

//: [Next](@next)
