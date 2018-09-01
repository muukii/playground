//: [Previous](@previous)

import Foundation

let canvas = [
  [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
  [1,1,0,1,1,3,1,1,0,3,1,1,1,1,1],
  [1,1,1,3,3,3,3,3,3,3,3,3,1,1,1],
  [1,1,1,1,1,3,1,1,0,3,1,1,1,1,1],
  [1,1,1,0,1,1,1,0,2,1,1,1,1,1,1],
  [1,1,1,1,3,3,2,3,3,3,3,1,1,1,1],
  [1,1,1,1,3,1,0,1,0,1,3,1,1,1,1],
  [1,1,0,1,3,3,3,2,3,3,3,1,1,1,1],
  [1,1,1,1,2,0,1,1,1,0,3,1,1,1,1],
  [1,1,1,1,3,3,3,3,3,3,3,1,1,1,1],
  [1,1,1,0,1,1,1,3,0,1,0,1,1,1,1],
  [1,1,1,3,3,2,3,3,3,2,3,3,1,1,1],
  [1,1,1,1,1,1,0,2,1,1,1,1,1,1,1],
  [1,1,1,0,1,0,1,3,1,1,0,1,1,1,1],
  [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
]

let height = canvas.count

let r = canvas.map { line in

  line.map { c -> String in

    switch c {
    case 0:
      return ":github_none:"
    case 1:
      return ":github_low:"
    case 2:
      return ":github_mid:"
    case 3:
      return ":github_high:"
    default:
      fatalError()
    }
  }
  .joined(separator: "")

}
.joined(separator: "\n")

print(r)

//: [Next](@next)
